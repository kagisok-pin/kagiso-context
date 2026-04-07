# GitHub Sync — Claude Code Prompt

**Use this prompt in a Claude Code session to push GlobalContext files to GitHub.**

---

## One-time Setup (only if repo not already cloned)

```
Clone kagisok-pin/kagiso-context to a local working directory, then proceed to the sync below.
```

---

## Standard Sync Prompt

Paste this into Claude Code when you need to push updates:

---

**PROMPT:**

```
Sync my GlobalContext files to GitHub.

Repo: kagisok-pin/kagiso-context
Local source: C:\Users\KagisoKomane\Documents\AIDevSpace\ClaudeSpace\GlobalContext\

Files to sync (copy these from local source to repo root, then commit and push):
- INDEX.md
- WORKING-STATE.md
- PROJECT-REGISTRY.md (new file added 30 March 2026)
- PROJECT-SCHEMA.md (new file added 30 March 2026)
- PROJECT-TRACKER-INTEGRATION.md (new file added 30 March 2026)

Commit message: "chore: add project tracking system — registry, schema, integration rules (30 Mar 2026)"

Steps:
1. Check current git status
2. Stage the listed files
3. Commit with the message above
4. Push to main
5. Confirm push succeeded and show the commit hash

Do not push any files outside of GlobalContext. Do not modify anything else in the repo.
```

---

## After Every Session (standard sync)

When WORKING-STATE.md or PROJECT-REGISTRY.md changes, use this shorter prompt:

```
Push updated GlobalContext files to GitHub (kagisok-pin/kagiso-context).

Updated files:
- WORKING-STATE.md
- PROJECT-REGISTRY.md

Commit message: "chore: update working state and project registry — [today's date]"

Stage, commit, push to main. Confirm with commit hash.
```
