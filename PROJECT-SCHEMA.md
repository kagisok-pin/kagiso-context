# Project Schema — Scaffold v3

**Version:** v3 — 9 April 2026
**Purpose:** Templates and procedures for creating and maintaining ClaudeSpace projects under the v3 scaffold standard.
**Spec source:** `ClaudeSpace/ongoing-initiative-management/live/FOLDER-DISCIPLINE-SCAFFOLD.md`

---

## How to Create a New Project

1. Create folder: `ClaudeSpace/<project-slug>/` (lowercase kebab-case, no spaces)
2. Create `PROJECT.md` using the card template below
3. Create `.claude/SOUL.md` using the SOUL template
4. Deploy checkpoint skill: copy `skills-library/checkpoint-SKILL-v1.md` → `.claude/skills/checkpoint/SKILL.md`
5. Add entry to `GlobalContext/PROJECT-REGISTRY.md`
6. Capture to Open Brain: `"PROJECT CREATED: [name] — [one-line objective]. Slug: [slug]."`
7. Update `WORKING-STATE.md` if P1 or P2

Create `workspace/`, `live/`, `_archive/` on first use — not as empty scaffolding.

---

## PROJECT.md Card Template

```markdown
# [Project Name]

**Slug:** <project-slug>
**Entity:** [Pinnacle Stone | Nolte Sandton | Arc & Mantle | Personal | Cross-entity]
**Status:** Initiate | Build | Live | Paused | Archived
**Priority:** P1 | P2 | P3 | P4
**Alignment:** [revenue | margin | institutional | strategic | personal | hygiene]
**Owner:** Kagiso
**Created:** YYYY-MM-DD
**Target completion:** YYYY-MM-DD or "Ongoing"

## Why

One sentence. Why does this project exist?

## Done means

- [ ] Deliverable 1 → `live/filename` or `[external system URL/path]`
- [ ] Deliverable 2 → `live/filename.xlsx`
- [ ] Deliverable 3 → deployed to [HubSpot / Cin7 / OneDrive path / etc.]

> If you can't write this section, the project isn't ready to start.

## Current phase

What's happening now. 2–3 lines max. Updated each session.

## Workstreams

### ws-name
**Status:** not-started | active | paused | complete
Brief description. Open tasks below.
- [ ] Task 1
- [ ] Task 2

## Decisions

| Date | Decision | Rationale |
|------|----------|-----------|

## Notes

Links, blockers, dependencies, context. Keep it short.
```

---

## SOUL.md Template

See full SOUL.md standard in `FOLDER-DISCIPLINE-SCAFFOLD.md`. Required sections in order:

1. Session Start — MEMORY-SYSTEM.md load instruction + 5-step boot sequence
2. Identity — Named agent persona, 3–6 sentences
3. Mission Scope — What this project covers, in/out of bounds
4. Domain-Specific Standards — What "good" looks like operationally
5. Domain Operating Context — Market realities, SA constraints
6. Research Guidance — Purpose-annotated source list
7. Context Loading — Tier 2 files + Open Brain queries + capture tag
8. Capture Protocol — What and when to capture
9. Checkpoint Protocol — Standard trigger rules + skill reference

SOUL.md must be under 200 lines. Content gets pasted into Cowork project instructions UI.

---

## Folder Scaffold

```
<project-slug>/
├── PROJECT.md                  ← Orientation card. THE entry point.
├── workspace/
│   ├── drafts/                 ← WIP documents, rough outputs
│   ├── research/               ← Reference material, inputs, specs
│   └── assets/                 ← Images, data files, raw inputs
├── live/                       ← Production artefacts. Staff-facing.
├── _archive/                   ← Superseded versions, dead branches
└── .claude/
    ├── SOUL.md                 ← AI instructions (replaces project-instructions.md)
    ├── skills/checkpoint/SKILL.md
    └── startup-prompt.md       ← Mobile session opener (optional)
```

**Mandatory at creation:** `PROJECT.md`, `.claude/SOUL.md`, checkpoint skill
**Create on first use:** `workspace/drafts/`, `workspace/research/`, `workspace/assets/`, `live/`, `_archive/`

---

## Priority Decision Guide

**P1 if ANY of:**
- Hard deadline within 30 days
- Direct revenue impact (deal, retention, cash)
- Legal or compliance risk
- Blocking a key hire or personnel decision

**P2 if:**
- Enables multiple future P1 outcomes
- No hard deadline but strategically material
- Builds compounding capability (systems, skills, infrastructure)

**P3 if:**
- Must-do but no urgency
- Admin, hygiene, compliance with long runway

**P4 if:**
- Exploratory, R&D, personal
- Can slip 60+ days with no real consequence

---

## Archive vs Close vs Kill

| Action | When | What to do |
|--------|------|-----------|
| **Complete + Archive** | Project finished, deliverables done | Run archive checklist, update registry to `archived` |
| **Kill** | Project cancelled mid-flight | Capture decision in Open Brain (type: decision). Registry status → `archived`, outcome: "killed — [reason]" |
| **Park** | No action for 90+ days | Status → `paused`, set revisit date in `target_close` field |

### Archive checklist

- [ ] All workstreams marked complete or explicitly parked
- [ ] All open tasks captured in Open Brain
- [ ] Key decisions captured in `decision-log.md` (if strategic)
- [ ] Deliverables filed to correct location (`live/` or external system)
- [ ] `WORKING-STATE.md` updated
- [ ] `PROJECT-REGISTRY.md` entry updated to `archived`
- [ ] Open Brain capture: `"PROJECT CLOSED: [name] — [outcome]"`

---

## Update Cadence

| Trigger | Who updates |
|---------|-------------|
| Project decision made | Capture to Open Brain immediately |
| Workstream completed | Update PROJECT.md + registry |
| End of week | EOW skill reviews P1/P2 status + scaffold compliance |
| New project created | PROJECT.md + registry + Open Brain reference thought |
| Project archived | Archive checklist, update registry |

---

## Migration Checklist (existing projects)

For projects being brought into v3 compliance:

1. [ ] Write `.claude/SOUL.md` (from existing project-instructions.md — strip boilerplate, keep unique content)
2. [ ] Write `PROJECT.md` card (absorb context from old context.md)
3. [ ] Create `workspace/` and move content files in
4. [ ] Create `live/` and move any staff-facing outputs in
5. [ ] Move `startup-prompt.md` to `.claude/startup-prompt.md`
6. [ ] Rename folder to lowercase kebab-case if needed (coordinate Cowork reconnect)
7. [ ] Paste SOUL.md into Cowork project instructions UI
8. [ ] Update `PROJECT-REGISTRY.md` entry (`soul_file:`, `agent:`, `scaffold_compliant: yes`)
9. [ ] Delete old `context.md` and `project-instructions.md` once confirmed
10. [ ] Create `_archive/` and move superseded files in
