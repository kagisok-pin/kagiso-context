# Project Schema — Standard Template

**Purpose:** Template for creating a new project's `PROJECT.md` context file. Every Cowork project should have one of these in its ClaudeSpace folder. Agents use this to understand what a project is, what's in scope, what's done, and what's next — without needing to read conversation history.

**Where this lives:** `ClaudeSpace/<project-slug>/PROJECT.md`
**Registry entry:** Always create a corresponding entry in `GlobalContext/PROJECT-REGISTRY.md`

---

## How to Create a New Project

1. Create a folder at `ClaudeSpace/<project-slug>/`
2. Copy and fill in the template below as `PROJECT.md`
3. Add an entry to `GlobalContext/PROJECT-REGISTRY.md`
4. Capture a reference-type thought to Open Brain: `"PROJECT CREATED: [name] — [one-line objective]. Slug: [slug]. Registry entry added."`
5. Update `WORKING-STATE.md` if the project is P1 or P2

---

## PROJECT.md Template

```markdown
# [Project Name] — Project Context

**Slug:** project-slug
**Entity:** [Pinnacle Stone | Nolte Sandton | Arc & Mantle | Personal | Cross-entity]
**Priority:** [P1 | P2 | P3 | P4]
**Status:** [active | paused | complete | archived]
**North Star Alignment:** [revenue | margin | institutional | strategic | personal | hygiene]
**Owner:** Kagiso
**Created:** YYYY-MM-DD
**Target Close:** YYYY-MM-DD (or "ongoing" or "tentative: Q3 2026")
**Last Updated:** YYYY-MM-DD
**Cowork Project Name:** "Exact name as shown in Cowork sidebar"

---

## Objective

One clear sentence. What does success look like when this project is done?

---

## Why This Exists

Two to four sentences on the business or personal case. Why now? What problem does it solve? What's the cost of not doing it?

---

## Workstreams

Each workstream is a named, trackable stream of work within the project.

### [ws-slug] Workstream Name

**Status:** [not-started | active | paused | complete]
**Owner:** Name
**Target:** YYYY-MM-DD or "after X is done"

What this workstream is doing and what done looks like.

**Open tasks:**
- [ ] Task 1
- [ ] Task 2

**Completed:**
- [x] Completed item

---

## Milestones

| Date | Milestone | Status |
|------|-----------|--------|
| YYYY-MM-DD | Description | pending / done |

---

## Blockers

| Blocker | Owner | Impact | Status |
|---------|-------|--------|--------|
| Description | Name | What it blocks | waiting / in progress |

---

## Decisions Log

Key decisions made within this project. Full detail lives in Open Brain (type: decision) and GlobalContext/decision-log.md for strategic ones.

| Date | Decision | Alternatives Rejected |
|------|----------|-----------------------|
| YYYY-MM-DD | What was decided | What was ruled out |

---

## Archive Checklist

Complete before archiving:

- [ ] All workstreams marked complete or explicitly parked
- [ ] All open tasks captured in Open Brain
- [ ] Key decisions captured in decision-log.md (if strategic)
- [ ] Deliverables filed to correct location
- [ ] WORKING-STATE.md updated
- [ ] PROJECT-REGISTRY.md entry updated to `archived`
- [ ] Open Brain archive thought captured: "PROJECT CLOSED: [name] — [outcome]"

---

## References

| Resource | Location | Notes |
|----------|----------|-------|
| Name | URL or file path | Description |
```

---

## Priority Decision Guide

Use this to assign priority when creating a project:

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
- Low strategic leverage

**P4 if:**
- Exploratory, R&D, personal
- Can slip 60+ days with no real consequence

---

## Archive vs Close vs Kill

| Action | When | What to do |
|--------|------|-----------|
| **Complete + Archive** | Project finished, deliverables done | Run archive checklist, move to ARCHIVE section in registry |
| **Kill** | Project cancelled mid-flight | Capture decision in Open Brain (type: decision) explaining why. Update registry status to `archived` with outcome: "killed — [reason]" |
| **Park** | Not cancelled but no action for 90+ days | Update status to `paused`, set a "revisit after" date in target_close field |

---

## Update Cadence

| Trigger | Who updates |
|---------|-------------|
| Any project decision made | Agent or Kagiso — Open Brain capture immediately |
| Workstream completed | Agent updates PROJECT.md + registry entry |
| End of week | EOW skill prompts review of P1/P2 project status |
| New project created | Agent creates PROJECT.md + registry entry + Open Brain reference thought |
| Project archived | Agent runs archive checklist, updates registry |
