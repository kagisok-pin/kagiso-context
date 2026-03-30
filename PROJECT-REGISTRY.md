# Project Registry

**Last Updated:** 2026-03-30
**Purpose:** Canonical index of all active, paused, and recently archived projects across all Cowork sessions. This file is the single source of truth for project status, priority, and next actions.
**Maintained by:** End-of-day and end-of-week skills + manual updates
**Synced to:** GitHub (kagisok-pin/kagiso-context)

---

## How to Read This File

### Priority Tiers
| Tier | Definition |
|------|------------|
| **P1** | Revenue impact within 30 days OR hard deadline |
| **P2** | Strategic multiplier — enables multiple future P1s |
| **P3** | Operational hygiene — must-do, not time-critical |
| **P4** | Exploration / R&D / personal development |

### North Star Alignment
| Tag | Meaning |
|-----|---------|
| `revenue` | Direct revenue generation or protection |
| `margin` | Cost reduction or margin improvement |
| `institutional` | Systems and capacity that compound over time |
| `strategic` | M&A, vertical integration, positioning |
| `personal` | Brand, coaching, development |
| `hygiene` | Compliance, admin, legal, maintenance |

### Status Values
`active` · `paused` · `complete` · `archived`

### Archive Rule
A project may be archived when: status = complete AND all workstreams closed AND all open tasks captured or closed in Open Brain AND any deliverables filed.

---

## Active Projects

---

### [PS-HR-2026] Pinnacle Stone — HR & Org Design 2026

```
slug:          pinnacle-hr-org-2026
entity:        Pinnacle Stone
priority:      P1
status:        active
alignment:     institutional
objective:     Complete the JD exercise, role grading, and org restructure that enables Sydney role split and salary review
owner:         Kagiso
started:       2026-02-01
target_close:  2026-05-31
last_updated:  2026-03-30
cowork_project: "Pinnacle| HR & Org Design 2026"
context_file:  ClaudeSpace/pinnacle-hr-org-2026/PROJECT.md
```

**Workstreams:**
- `jd-reviews` — 18 JDs, deadline 31 March 2026. Near complete.
- `ops-role-redesign` — Sydney splits into Production Manager + Sales Ops Manager. Approved 26 Mar.
- `rm-transition` — RM Role Transition complete (meetings phase active). GP meetings 30 Mar.
- `sydney-psp` — Day 30 PSP review 15 April.
- `amy-trial` — 30-day trial conclusion ~1 April. Binary: confirm or exit.
- `rm-survey` — Survey reminders 1 April; deadline 6 April.
- `noma-contract` — Employment contract draft week of 2 April.
- `salary-review` — Sequenced after JDs finalised.
- `incentive-scheme` — Design broad incentive scheme (financial + non-financial). Follow-on to JDs.
- `sales-inventory-admin` — Recruitment open, closing 16 April.

**Next actions:**
1. Batch sign any outstanding JDs — Monday 30 March
2. Score Amy Abbott trial (90 min block before 1 April)
3. GP RM meetings (Katlego + Amorette) — 30 March

---

### [ACQ-KAMEN] Kamen M&G Acquisition

```
slug:          acquisitions-kamen
entity:        Arc & Mantle
priority:      P1
status:        active
alignment:     strategic
objective:     Determine Go/No-Go on acquiring Kamen Marble & Granite before or at 9 April in-person visit
owner:         Kagiso
started:       2026-03-01
target_close:  2026-04-30
last_updated:  2026-03-30
cowork_project: "Acquisitions"
context_file:  ClaudeSpace/acquisitions/PROJECT.md
```

**Workstreams:**
- `strategic-fit-assessment` — NOT YET STARTED. Must complete before 9 April.
- `information-request` — Letter to Kamen not yet drafted.
- `cipc-sars-checks` — Not started.
- `share-vs-asset-analysis` — Not started.
- `dd-visit-prep` — In-person visit 9 April. Go/No-Go decision post-visit.

**Go/No-Go gates:** Channel conflict check, operator availability, 18-month payback test.

**Next actions:**
1. Run strategic fit assessment — this week
2. Draft information request letter
3. CIPC search

---

### [SALES-TECH] Sales Tech Stack

```
slug:          sales-tech-stack
entity:        Pinnacle Stone
priority:      P1
status:        active
alignment:     revenue
objective:     Build a phased sales technology programme from HubSpot foundation through AI prospecting
owner:         Kagiso
started:       2026-03-28
target_close:  2026-12-31
last_updated:  2026-03-30
cowork_project: "Sales Tech Stack"
context_file:  ClaudeSpace/sales-tech-stack/PROJECT.md
```

**Workstreams:**
- `phase-1-hubspot` — HubSpot lead management foundation. Start immediately.
- `phase-2-ai-sdr` — AI SDR build. Target April 2026. Architecture decision to capture.
- `phase-2-ai-prospecting` — AI Prospecting Engine. Target 14 April.
- `phase-3-cin7-integration` — Cin7 ↔ HubSpot ↔ Make integration. Parked until 2027.

**Next actions:**
1. Start HubSpot lead management Phase 1 — this week
2. Capture AI SDR architecture decision and formally move implementation to Q2

---

### [MKT-INT] Market Intelligence

```
slug:          market-intelligence
entity:        Pinnacle Stone
priority:      P2
status:        active
alignment:     strategic
objective:     Complete product mix competitive study covering all product lines vs local competitors
owner:         Kagiso
started:       2026-03-23
target_close:  2026-04-30
last_updated:  2026-03-30
cowork_project: "Market Intelligence"
context_file:  ClaudeSpace/market-intelligence/PROJECT.md
```

**Workstreams:**
- `product-mix-study` — All product lines vs local competitors (range, pricing, market fit). Triggered by Mirage meeting 19 March. Deliverable in progress.
- `competitor-analysis` — Merged into product mix study (was separate task from 11 March).

**Next actions:**
1. Complete product mix study deliverable

---

### [INST-CAP] Institutional Capacity

```
slug:          institutional-capacity
entity:        Pinnacle Stone
priority:      P2
status:        active
alignment:     institutional
objective:     Build foundational knowledge and AI competence infrastructure — Staff KB, product training, and weekly AI planning cadence
owner:         Kagiso
started:       2026-03-28
target_close:  2026-09-30
last_updated:  2026-03-30
cowork_project: "Institutional Capacity"
context_file:  ClaudeSpace/institutional-capacity/PROJECT.md
```

**Workstreams:**
- `staff-kb-rag` — Staff Knowledge Base (RAG-powered). Queued after OpenClaw sprint.
- `product-training` — Tile induction + product training. Linked to KB. Queued after KB foundation.
- `ai-competence` — AI Competence Programme. ACTIVE at weekly planning cadence. Phase 1: role-task mapping. First session week of 30 March.

**Next actions:**
1. Run first AI Competence planning session — week of 30 March

---

### [AI-INFRA] AI Agent Infrastructure

```
slug:          ai-agent-infrastructure
entity:        Personal / Cross-entity
priority:      P2
status:        active
alignment:     institutional
objective:     Prove self-hosted agent architecture (NemoClaw) and extend Open Brain with visual layer and edge functions
owner:         Kagiso
started:       2026-03-20
target_close:  2026-04-10
last_updated:  2026-03-30
cowork_project: "AI Agent Infrastructure"
context_file:  ClaudeSpace/ai-agent-infrastructure/context.md
```

**Workstreams:**
- `nemoclaw-sprint` — 3-week sprint. Paused at Hetzner ID verification (20 March). Week 2 scope: first custom skills + Pinnacle Stone use cases. Sprint end ~10 April.
- `open-brain-extensions` — Visual web app on Vercel. Phase 0 complete. Phase 1 (Relationships Tracker) mostly complete. MCP edge functions pending.
- `checkpoint-skill` — Built. Deploy to Cowork + Code.
- `eow-skill` — Built. Deploy to Cowork + Code.
- `architecture-fixes` — Pending: paste into all 5 project instructions.
- `supabase-edge-functions` — Spec written. Code session needed.

**Next actions:**
1. Resolve Hetzner ID verification
2. Deploy CHECKPOINT + EOW skills to projects
3. Paste architecture fixes into all project instructions
4. Build Supabase edge functions (Code session)

---

### [OB] OpenBrain

```
slug:          openbrain
entity:        Personal / Infrastructure
priority:      P2
status:        active
alignment:     institutional
objective:     Maintain and evolve the Open Brain memory system — deduplication, hygiene, and new capabilities
owner:         Kagiso
started:       2026-02-14
target_close:  ongoing
last_updated:  2026-03-30
cowork_project: "OpenBrain"
context_file:  ClaudeSpace/OpenBrainDev/
```

**Workstreams:**
- `deduplication` — 5 duplicate clusters identified (NemoClaw x4, CHECKPOINT x3 + others). Edge function spec written.
- `monthly-prune` — Spec written. First prune to be scheduled.
- `type-fix` — capture_thought ignores type parameter. Supabase edge function fix needed.
- `hygiene` — Ongoing: CHECKPOINT + EOW skills provide session-level protection.

**Next actions:**
1. Build Supabase edge function for thought type fix (coordinate with AI-INFRA)
2. Run first deduplication pass
3. Schedule monthly prune

---

### [LI] Komane LinkedIn

```
slug:          komane-linkedin
entity:        Personal
priority:      P3
status:        active
alignment:     personal
objective:     Rebuild Kagiso and Wanela's LinkedIn profiles for B2B personal brand and credibility
owner:         Kagiso
started:       2026-03-29
target_close:  2026-06-30
last_updated:  2026-03-30
cowork_project: "Komane LinkedIn"
context_file:  ClaudeSpace/Komane LinkedIn/
```

**Workstreams:**
- `kagiso-profile-phase1` — Static assets: headline, about, experience, featured, recommendations, banner. Headline decision pending (3 options proposed — A: vertical integration, B: audience-led, C: vision-led).
- `wanela-profile-phase1` — Institutional credibility signal. Not started.
- `content-strategy` — Phase 2. Target late June 2026.

**Next actions:**
1. Confirm headline direction (A/B/C) to unblock rest of Phase 1

---

### [SYD-PSP] Sydney Structured Performance Plan

```
slug:          sydney-psp
entity:        Pinnacle Stone
priority:      P1
status:        active
alignment:     institutional
objective:     Complete Sydney's 30-day PSP and confirm or restructure the Operations Manager role
owner:         Kagiso
started:       2026-03-15
target_close:  2026-04-15
last_updated:  2026-03-30
cowork_project: "Sydney Structured Performance P"
context_file:  ClaudeSpace/sydney-psp/PROJECT.md
```

**Note:** This is a sub-workstream of [PS-HR-2026] but given a separate Cowork project. Day 30 review 15 April.

**Next actions:**
1. Day 30 review — 15 April

---

### [AURIK] Aurik Programme

```
slug:          aurik
entity:        Personal
priority:      P3
status:        active
alignment:     personal
objective:     Complete the Aurik coaching/accelerator programme deliverables
owner:         Kagiso
started:       2026-Q1
target_close:  2026-TBD
last_updated:  2026-03-30
cowork_project: "Aurik"
context_file:  ClaudeSpace/Aurik/
```

**Next actions:**
1. Confirm current programme milestones and deliverables

---


### [OIM] Ongoing Initiative Management (Project Tracker)

```
slug:          ongoing-initiative-management
entity:        Personal / Meta
priority:      P3
status:        active
alignment:     institutional
objective:     Maintain and evolve the cross-entity project tracking system — registry, schemas, and integration rules
owner:         Kagiso
started:       2026-03-30
target_close:  ongoing
last_updated:  2026-03-30
cowork_project: "Ongoing Initiative Management"
context_file:  ClaudeSpace/GlobalContext/PROJECT-REGISTRY.md
```

**Purpose:** This is the home project for the project tracking system itself. Any work on PROJECT-REGISTRY.md, PROJECT-SCHEMA.md, PROJECT-TRACKER-INTEGRATION.md, or the morning brief integration happens in this Cowork project.

**Next actions:**
1. Wire PROJECT-REGISTRY.md into start-of-day skill (done — skill updated 30 March)
2. Create individual PROJECT.md files for projects that don't have them yet

---

### [RITUALS] Daily Rituals

```
slug:          daily-rituals
entity:        Personal
priority:      P3
status:        active
alignment:     hygiene
objective:     Maintain and evolve daily operating rituals — start-of-day, end-of-day, end-of-week skills
owner:         Kagiso
started:       2026-03-01
target_close:  ongoing
last_updated:  2026-03-30
cowork_project: "Daily Rituals"
context_file:  ClaudeSpace/daily-rituals/
```

**Workstreams:**
- `start-of-day` — Skill deployed. Reads WORKING-STATE.md + relationships warmth.
- `end-of-day` — Skill built and updated. Deployed.
- `end-of-week` — Skill built. Deploy pending.

---

## Archived Projects

```
slug:     finserv-dispute
closed:   2026-03-30
outcome:  Settled for R38,000 with Jerry. Payment this week. Resolved.
```

---

## Metadata

| Field | Value |
|-------|-------|
| Confidence | Evolving — first population 30 March 2026 |
| Related files | INDEX.md, WORKING-STATE.md, decision-log.md |
| Review trigger | End-of-week skill, or when a project changes status |
| GitHub sync | Push to kagisok-pin/kagiso-context after updates |
