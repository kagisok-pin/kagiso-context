# Project Tracker — Integration & Operating Rules

**Last Updated:** 2026-03-30
**Purpose:** Instructions for any agent on how to use, update, and query the project tracking system. Read this alongside PROJECT-REGISTRY.md and PROJECT-SCHEMA.md.

---

## System Architecture (Three Stores)

```
┌──────────────────────────────────────────────────────────────┐
│  LAYER 1 — PROJECT-REGISTRY.md (GlobalContext/)              │
│  Canonical index. One entry per project. Priority + status.  │
│  Synced to GitHub. Loaded by morning brief and EOW skills.   │
└──────────────────┬───────────────────────────────────────────┘
                   │
┌──────────────────▼───────────────────────────────────────────┐
│  LAYER 2 — PROJECT.md (ClaudeSpace/<slug>/)                  │
│  Full project detail. Workstreams, milestones, blockers,     │
│  decisions, archive checklist. Human and agent readable.     │
└──────────────────┬───────────────────────────────────────────┘
                   │
┌──────────────────▼───────────────────────────────────────────┐
│  LAYER 3 — Open Brain (dynamic memory)                       │
│  In-motion state: tasks, decisions, person notes, outcomes.  │
│  Queried by search_thoughts() and list_thoughts().           │
│  NOT a substitute for Layer 1/2 — it is the change log.     │
└──────────────────────────────────────────────────────────────┘
```

**Conflict resolution:** PROJECT-REGISTRY.md wins for project status and priority → PROJECT.md wins for workstream detail → Open Brain wins for most recent event → decision-log.md wins for settled strategic decisions.

---

## When to Load What

| Situation | Load |
|-----------|------|
| Morning brief / start-of-day | PROJECT-REGISTRY.md — filter for P1 + P2 active projects |
| Working within a specific project | PROJECT.md for that project only |
| Checking if something was already decided | Open Brain search → decision-log.md |
| Creating a new project | PROJECT-SCHEMA.md |
| End-of-week review | PROJECT-REGISTRY.md — review all active, flag anything to archive |
| Priority decision | PROJECT-REGISTRY.md — all active projects by tier |

---

## Rules for Agents

### On Starting a Project Session
1. Read PROJECT-REGISTRY.md entry for this project (slug lookup)
2. Read the project's PROJECT.md
3. Query Open Brain: `search_thoughts("<project-slug>")` for recent context
4. Begin work — do not skip steps 1–3

### On Making a Decision Within a Project
1. Capture to Open Brain immediately: `"DECISION: [what] — [why] — [alternatives rejected]"` with entity tag
2. Update PROJECT.md decisions log
3. If strategic (affects multiple entities or Arc & Mantle level), also add to decision-log.md
4. Do NOT wait until end of session

### On Completing a Workstream
1. Mark the workstream as `complete` in PROJECT.md
2. Update `last_updated` date
3. Capture to Open Brain: `"TASK CLOSED — [workstream name] in [project]. [outcome]. Completed YYYY-MM-DD."`
4. Check if all workstreams are now complete → if yes, flag project for archive review

### On Creating a New Project
1. Read PROJECT-SCHEMA.md
2. Create `ClaudeSpace/<slug>/PROJECT.md` from the template
3. Add entry to PROJECT-REGISTRY.md
4. Capture to Open Brain: `"PROJECT CREATED: [name] — [objective]. Slug: [slug]. Priority: [Px]. Entity: [entity]."`
5. If P1 or P2: add to WORKING-STATE.md top priorities

### On Archiving a Project
1. Run the archive checklist in PROJECT.md
2. Change `status` to `archived` in both PROJECT.md and PROJECT-REGISTRY.md
3. Move registry entry to the "Archived Projects" section
4. Capture to Open Brain: `"PROJECT CLOSED: [name] — [outcome]. Archived YYYY-MM-DD."`
5. Update WORKING-STATE.md if the project was listed there

### On Killing a Project
1. Capture to Open Brain: `"DECISION: [project name] killed — [reason]. Alternatives considered: [what else was considered]."`
2. Update status to `archived` in registry with outcome: `"killed — [reason]"`
3. No archive checklist needed (just the decision capture)

---

## Start-of-Day Integration

When the start-of-day skill runs, it MUST:
1. Read `GlobalContext/PROJECT-REGISTRY.md`
2. Filter: `status = active AND priority IN (P1, P2)`
3. For each match, surface: project name, next action, and any hard dates within 14 days
4. Order: P1 by date proximity, then P2 alphabetically

Output format for morning brief:
```
## Priority Projects
[P1] Project Name — Next action / Hard date
[P2] Project Name — Next action
```

---

## End-of-Week Integration

When the end-of-week skill runs, it MUST:
1. Read PROJECT-REGISTRY.md
2. Prompt review of all P1 and P2 active projects:
   - Did priority change? Update registry.
   - Did any workstream complete? Update PROJECT.md + registry.
   - Is any project now archivable? Run checklist.
   - Are there any P3/P4 projects that have had no action in 30 days? Flag for kill or park.
3. Update `last_updated` field for any projects touched this week
4. Confirm GitHub push after updates

---

## Checkpoint Integration

When the CHECKPOINT skill runs (compaction protection):
1. Capture current project context to Open Brain:
   `"CHECKPOINT: Working on [project] — [current state]. [Next steps]. YYYY-MM-DD."`
2. Do NOT re-read PROJECT-REGISTRY.md in full — just capture what's active in the current session

---

## Priority Review Triggers

Re-evaluate a project's priority tier when:
- A hard deadline is set or moves
- A deal is won or lost that changes revenue context
- A blocker is cleared or created
- A new project is created (check if it displaces something)
- End-of-week review

---

## Project Sprawl Controls

**Max active P1 projects:** 5
**Max active P2 projects:** 7
**If either limit is exceeded:**
1. Review all active projects at that tier
2. Either demote one or explicitly argue why the new one justifies the exception

**30-day no-action rule:** Any active project with `last_updated` > 30 days ago is automatically flagged for kill/park decision in EOW review.

**New project gate:** Before creating a new Cowork project, check if:
- It fits inside an existing project as a workstream (prefer this)
- It truly needs its own project space
- It requires retiring or completing something else first

---

## File Locations (Canonical)

| File | Path |
|------|------|
| Project Registry | `ClaudeSpace/GlobalContext/PROJECT-REGISTRY.md` |
| Project Schema | `ClaudeSpace/GlobalContext/PROJECT-SCHEMA.md` |
| This file | `ClaudeSpace/GlobalContext/PROJECT-TRACKER-INTEGRATION.md` |
| Individual projects | `ClaudeSpace/<project-slug>/PROJECT.md` |
| GitHub remote | `kagisok-pin/kagiso-context` (GlobalContext files only) |
| Open Brain | MCP via `capture_thought`, `search_thoughts`, `list_thoughts` |

---

## GitHub Sync Rules

Files that MUST be pushed to GitHub after any update:
- `PROJECT-REGISTRY.md`
- `INDEX.md`
- `WORKING-STATE.md`

Files that stay local (ClaudeSpace only):
- Individual `PROJECT.md` files (too dynamic for GitHub; Open Brain handles recency)

---

## For Any New Agent Picking Up This Project

Read in this order:
1. `GlobalContext/INDEX.md` — who Kagiso is, what entities exist
2. `GlobalContext/WORKING-STATE.md` — what's urgent this week
3. `GlobalContext/PROJECT-REGISTRY.md` — what projects exist, their priority and status
4. `ClaudeSpace/<project-slug>/PROJECT.md` — detail for the specific project you're working on
5. `search_thoughts("<project-slug>")` — recent decisions and events from Open Brain
6. Begin work

If you detect a contradiction between files: flag it to Kagiso. Do not silently resolve it.
