#!/usr/bin/env python3
"""
GitHub Contents API sync for GlobalContext files.

Usage:
    python3 github_sync.py "commit message" file1.md file2.md ...

Resolves paths dynamically — no hardcoded session IDs. Works across
Cowork sessions regardless of the session path assigned.

Reads the GitHub PAT from ClaudeSpace/Credentials/github_token.txt.
Compares local vs remote content for each file and only commits files
that have actually changed. Creates one commit per changed file via the
Contents API (single-commit batching requires the Git Trees API — not
implemented here to keep the script simple and auditable).

Exit codes:
    0 — all files synced (or skipped because unchanged)
    1 — token missing or invalid
    2 — one or more files failed to sync
"""

import sys
import os
import base64
import json
import glob

try:
    import requests
except ImportError:
    os.system("pip install requests --break-system-packages -q")
    import requests

# --- Config ---
REPO = "kagisok-pin/kagiso-context"
API = f"https://api.github.com/repos/{REPO}/contents"


def find_path(pattern, label):
    """Find a file or directory matching a glob pattern under /sessions/."""
    matches = glob.glob(pattern, recursive=True)
    if matches:
        return matches[0]
    return None


def resolve_token_path():
    """Dynamically find github_token.txt across session mounts."""
    # Try the standard location relative to this script first
    script_dir = os.path.dirname(os.path.abspath(__file__))
    local_candidate = os.path.join(script_dir, "..", "Credentials", "github_token.txt")
    if os.path.exists(local_candidate):
        return os.path.abspath(local_candidate)

    # Fallback: search /sessions/
    found = find_path("/sessions/*/mnt/ClaudeSpace/Credentials/github_token.txt", "token")
    if found:
        return found

    return None


def resolve_globalcontext_path():
    """Dynamically find the GlobalContext directory across session mounts.

    Handles two mount layouts:
      A) GlobalContext mounted directly:  mnt/GlobalContext/scripts/github_sync.py
         → script_dir/..  IS GlobalContext (validated by WORKING-STATE.md presence)
      B) ClaudeSpace mounted as root:     mnt/ClaudeSpace/GlobalContext/scripts/github_sync.py
         → script_dir/../GlobalContext
    Falls back to glob search if neither local candidate resolves.
    """
    script_dir = os.path.dirname(os.path.abspath(__file__))

    # Case A: script lives inside GlobalContext/scripts/ — parent IS GlobalContext
    parent = os.path.abspath(os.path.join(script_dir, ".."))
    if os.path.isdir(parent) and os.path.exists(os.path.join(parent, "WORKING-STATE.md")):
        return parent

    # Case B: script lives inside ClaudeSpace/GlobalContext/scripts/
    local_candidate = os.path.abspath(os.path.join(script_dir, "..", "GlobalContext"))
    if os.path.isdir(local_candidate) and os.path.exists(os.path.join(local_candidate, "WORKING-STATE.md")):
        return local_candidate

    # Fallback: search /sessions/ for any GlobalContext with WORKING-STATE.md
    for pattern in [
        "/sessions/*/mnt/GlobalContext",
        "/sessions/*/mnt/ClaudeSpace/GlobalContext",
    ]:
        for m in glob.glob(pattern):
            if os.path.isdir(m) and os.path.exists(os.path.join(m, "WORKING-STATE.md")):
                return m

    return None


def load_token(token_path):
    try:
        token = open(token_path).read().strip()
        if not token or token == "REPLACE_WITH_YOUR_GITHUB_PAT":
            return None
        return token
    except (FileNotFoundError, PermissionError):
        return None


def sync_file(filename, message, headers, local_root):
    """Sync a single file to GitHub. Returns (status, detail)."""
    local_path = os.path.join(local_root, filename)

    if not os.path.exists(local_path):
        return "SKIP", f"Local file not found: {filename}"

    # Read local content
    with open(local_path, "rb") as f:
        local_content = f.read()

    # Get remote SHA and content
    resp = requests.get(f"{API}/{filename}", headers=headers)

    if resp.status_code == 404:
        # New file — create it
        remote_sha = None
        remote_content = b""
    elif resp.status_code == 200:
        data = resp.json()
        remote_sha = data["sha"]
        remote_content = base64.b64decode(data["content"])
    else:
        return "FAIL", f"GET {filename}: {resp.status_code} {resp.text[:150]}"

    # Compare
    if local_content == remote_content:
        return "UNCHANGED", f"{filename} — identical, skipped"

    # Push
    payload = {
        "message": f"{message} [{filename}]" if remote_sha else f"Add {filename} — {message}",
        "content": base64.b64encode(local_content).decode("utf-8"),
    }
    if remote_sha:
        payload["sha"] = remote_sha

    put_resp = requests.put(f"{API}/{filename}", headers=headers, json=payload)

    if put_resp.status_code in (200, 201):
        new_sha = put_resp.json()["content"]["sha"][:12]
        return "OK", f"{filename} → {new_sha}"
    else:
        return "FAIL", f"PUT {filename}: {put_resp.status_code} {put_resp.text[:150]}"


def main():
    if len(sys.argv) < 3:
        print("Usage: github_sync.py 'commit message' file1.md [file2.md ...]")
        sys.exit(1)

    message = sys.argv[1]
    files = sys.argv[2:]

    # Resolve paths dynamically
    token_path = resolve_token_path()
    if not token_path:
        print("ERROR: github_token.txt not found. Searched:")
        print("  - Relative: <script_dir>/../Credentials/github_token.txt")
        print("  - Fallback: /sessions/*/mnt/ClaudeSpace/Credentials/github_token.txt")
        sys.exit(1)

    local_root = resolve_globalcontext_path()
    if not local_root:
        print("ERROR: GlobalContext directory not found. Searched:")
        print("  - Relative: <script_dir>/../GlobalContext/")
        print("  - Fallback: /sessions/*/mnt/ClaudeSpace/GlobalContext/")
        sys.exit(1)

    print(f"Token:  {token_path}")
    print(f"Source: {local_root}")
    print(f"Target: github.com/{REPO}")
    print()

    token = load_token(token_path)
    if not token:
        print("ERROR: Token missing or placeholder. Check Credentials/github_token.txt")
        sys.exit(1)

    headers = {
        "Authorization": f"token {token}",
        "Accept": "application/vnd.github.v3+json",
    }

    # Verify token
    user_resp = requests.get("https://api.github.com/user", headers=headers)
    if user_resp.status_code != 200:
        print(f"ERROR: Token invalid (HTTP {user_resp.status_code})")
        sys.exit(1)

    print(f"Syncing {len(files)} file(s) to {REPO}...")
    results = []
    had_failure = False

    for f in files:
        status, detail = sync_file(f, message, headers, local_root)
        results.append((status, detail))
        icon = {"OK": "✓", "UNCHANGED": "—", "SKIP": "⚠", "FAIL": "✗"}[status]
        print(f"  {icon} {detail}")
        if status == "FAIL":
            had_failure = True

    synced = sum(1 for s, _ in results if s == "OK")
    unchanged = sum(1 for s, _ in results if s == "UNCHANGED")
    failed = sum(1 for s, _ in results if s == "FAIL")

    print(f"\nDone: {synced} synced, {unchanged} unchanged, {failed} failed.")
    sys.exit(2 if had_failure else 0)


if __name__ == "__main__":
    main()
