# Memory System — Kagiso Komane Operating Environment

**Version:** 1.2
**Last Updated:** 2026-04-09
**Location:** `GlobalContext/MEMORY-SYSTEM.md`
**GitHub:** `https://raw.githubusercontent.com/kagisok-pin/kagiso-context/main/MEMORY-SYSTEM.md`

This is the single source of truth for memory system rules, capture protocols, and credential setup across all Cowork projects. It is loaded explicitly at session start. If it cannot be loaded, the session must not proceed.

---

## Tier 1 — Always Load First

Before doing any work, read these from GlobalContext:
- `INDEX.md` — Master index, entity overview, loading instructions
- `WORKING-STATE.md` — Current priorities, blockers, recent outcomes
- `WORKING-PRACTICES.md` — File placement rules, naming conventions, promotion rules (applies to all agents)

**Local path:** `C:\Users\KagisoKomane\Documents\AIDevSpace\ClaudeSpace\GlobalContext\`
**GitHub fallback:** `https://raw.githubusercontent.com/kagisok-pin/kagiso-context/main/<filename>.md`

---

## Tier 2 — Available Context Files

Load only what is relevant to the current session. One business file at a time unless discussion explicitly spans entities.

| File | Load when discussing... |
|------|------------------------|
| `profile-kagiso.md` | ADHD context, tech stack, AI personas, personal context |
| `business-pinnacle-stone.md` | Stone distribution, Pinnacle ops, team, products |
| `business-nolte-sandton.md` | Kitchens, luxury retail, Nolte brand, showroom |
| `platform-arc-mantle.md` | Group strategy, holding structure, vertical integration |
| `people-org.md` | Specific people, org chart, roles, HR matters |
| `PROJECT-REGISTRY.md` | Project status, priorities, workstreams, next actions |
| `decision-log.md` | Settled decisions — check before re-litigating anything |
| `environment-market.md` | Market analysis, competitive positioning |

Each project's instructions specify which Tier 2 files are most relevant for that project.

---

## Tier 2b — Open Brain

Open Brain is the live memory layer. Always query when recency matters — it captures what has changed since the context files were last updated.

| Tool | When to use |
|------|-------------|
| `search_thoughts("query")` | Find context on a topic, person, decision, or task |
| `list_thoughts(days=7)` | Recent activity — use at every session start |
| `capture_thought("content")` | Save a decision, task, insight, or person note |

Each project's instructions specify the recommended search queries for that project's topic area.

---

## Capture Rules

### Entity Tags (required on every thought)

Every thought must be prefixed with its entity context:

| Tag | Use for |
|-----|---------|
| `[Pinnacle Stone]` | Pinnacle Stone operations, projects, team |
| `[Nolte Sandton]` | Nolte Kitchens GP operations and projects |
| `[Arc & Mantle]` | Group strategy, acquisitions, holding structure |
| `[Personal]` | Personal projects, brand, AI infrastructure, tooling |

Each project's instructions specify the correct default tag.

### Detection Patterns

**DECISION DETECTION:** Capture when options are discussed and one is chosen, a tool or approach is selected, a phase transition occurs, a deadline is set or changed, or a strategic direction is confirmed.

**PERSON NOTE DETECTION:** Capture when performance observations, role changes, working style insights, or relationship dynamics emerge about specific people.

**REFERENCE DETECTION:** Capture ALL URLs, API endpoints, system mappings, infrastructure details, document locations, and key links when shared.

**TASK CLOSURE:** When a task from Open Brain is completed, capture: `"TASK CLOSED — [summary]. Completed [date]."`

---

## Session End Protocol

Before closing any session:
1. Capture key outcomes to Open Brain — one thought per distinct outcome (decisions, completions, blockers)
2. If GlobalContext files were changed, push to GitHub using the credential setup below (or create an EOD.md handoff for Code sessions that can't push directly)
3. If a task was completed, capture a closure observation in Open Brain

---

## Skills Rule

If you create or modify a skill in this session:
1. Write or edit the skill in `ClaudeSpace/anchor/` first — this is the source of truth (renamed from skills-library/ on 9 April 2026)
2. Copy the file into `.claude/skills/<skill-name>/` in each Cowork project that should use it
3. Increment the version number on every meaningful change
4. Do not edit only the deployed copy — it will be overwritten next time the library version is deployed

---

## Git Credential Setup

When git push fails due to missing credentials, run this once per session:

```bash
cd /sessions/[session-id]/mnt/GlobalContext
git config user.name "Kagiso Komane"
git config user.email "kagisok@gmail.com"
PAT=$(cat .github-pat)
git remote set-url origin https://${PAT}@github.com/kagisok-pin/kagiso-context.git
```

The PAT file lives at `GlobalContext/.github-pat` (gitignored).
PAT expires **2026-04-29** — renew via `ClaudeSpace/Credentials/README.md`.

---

## Mobile / Remote Mode

When local file mounts are unavailable (e.g. working on phone or a different machine), ALL context files are accessible via GitHub raw URLs:

**GlobalContext files:**
`https://raw.githubusercontent.com/kagisok-pin/kagiso-context/main/<filename>.md`

**Project context files:**
`https://raw.githubusercontent.com/kagisok-pin/kagiso-context/main/projects/<slug>/PROJECT.md`

| Project | Slug |
|---------|------|
| Sales Tech Stack | `sales-tech-stack` |
| Acquisitions | `acquisitions` |
| AI Agent Infrastructure | `ai-agent-infrastructure` |
| Institutional Capacity | `institutional-capacity` |
| Market Intelligence | `market-intelligence` |

**Mobile startup sequence:** When the startup prompt's local file reads fail, Claude should automatically fall back to the GitHub raw URLs above. The `git pull` step should be skipped (no local repo available). Report to user which mode is active (local vs GitHub fallback).

### PROJECT.md Sync Rule

The canonical version of each `PROJECT.md` lives in the local project folder (`ClaudeSpace/<slug>/PROJECT.md`). The GitHub copy is a mirror for remote access. When a PROJECT.md is updated locally:
1. Push the updated file to GitHub during the session end protocol
2. Use the GitHub Contents API if `git push` is blocked (lock files, permissions)
3. The EOD and EOW skills should include project context sync in their checklists
