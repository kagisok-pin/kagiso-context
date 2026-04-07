# AI Agent Infrastructure — Project Context

**Created:** 2026-03-28
**Entity:** Personal / Cross-entity
**Status:** Active — NemoClaw sprint in progress, Open Brain Extensions Phase 1 in progress

---

## What This Is

Kagiso's personal AI agent experimentation and tooling programme. Covers the NemoClaw/OpenClaw sprint, Open Brain Extensions, and supporting tools like the CHECKPOINT skill. This is R&D that feeds into business applications (Staff KB, AI SDR, prospecting engine) once patterns are proven.

## Active Workstreams

### 1. NemoClaw Sprint (Active — paused at Hetzner ID check)
**What:** 3-week experiment with NVIDIA's NemoClaw (security stack wrapping OpenClaw) to evaluate self-hosted AI agent architecture.

**Status:** Week 1 paused at Hetzner account verification (20 March). Once verified, pick up at server provisioning.

**Sprint plan:**
- Week 1 (20–27 Mar): Setup + sandbox exploration — PAUSED
- Week 2 (27 Mar – 3 Apr): First custom skills + Pinnacle Stone use cases
- Week 3 (3–10 Apr): Evaluate Nemotron 3 Super vs Claude, privacy router testing, production path assessment

**Infrastructure:**
- Host: Hetzner Cloud VPS, CPX31 (4 vCPU, 8GB RAM, 160GB SSD, ~$20.69/mo)
- Inference: NVIDIA Cloud API free tier → Nemotron 3 Super 120B
- Channel: Telegram bridge
- Region: eu-central (no Hetzner SA presence)

**Security operating principles:**
1. Strictest policy first — loosen only for specific needs
2. No community skills (ClawHub had 20% supply chain compromise in Feb 2026) — write or manually review everything
3. Sandbox isolated from production systems until Week 3
4. Never set ANTHROPIC_API_KEY in sandbox (silent model override bug)

**Key reference:** 724-Office repo (https://github.com/wangziqi06/724-office) — self-evolving AI agent, ~3,500 lines pure Python, zero framework. Relevant for OpenClaw sprint as reference architecture.

### 2. Open Brain Extensions (Active — Phase 1)
**What:** Visual web apps built on top of Open Brain using Nate's "two-door" architecture (agent door via MCP + human door via visual web on Vercel).

**Deployed:**
- Live URL: https://openbrain-views.vercel.app
- GitHub: https://github.com/kagisok-pin/openbrain-views (private)
- Stack: Next.js 16 + TypeScript + Tailwind + shadcn/ui + Supabase JS client + Vercel free tier

**Phase 0 (COMPLETE):** Foundation deployed — NavBar with Dashboard / Relationships / Household routes, env vars configured, git-push-to-deploy working.

**Phase 1 — Professional Relationships Tracker (MOSTLY COMPLETE):**
- Supabase `relationships` table with computed warmth column (hot/warm/cooling/cold)
- 9 seed contacts, RLS enabled
- Visual layer: warmth summary tiles, filterable card list, detail modal, inline editing, quick-log contact
- MCP agent door confirmed working (query, add, update all tested)
- Person notes migrated (Dieketseng + Sydney enriched)
- Weekly attention view built, SOD skill integration done

**Remaining Phase 1 work:**
- MCP Edge Functions for agent door (some pending)
- SQL file at `openbrain-views/supabase/001_create_relationships.sql` — must be run in Supabase SQL Editor

**Phase 2 — Household KB:** Visual layer deployed, awaiting seed data session.
**Phase 3 — Cross-Category Dashboard:** Parked until data accumulates.

### 3. CHECKPOINT Skill (BUILT — Deploy Pending)
- Skill file built 28 March
- Needs copying to `.claude/skills/checkpoint/SKILL.md` in both Cowork and Code environments
- Proactive compaction protection — Claude monitors session depth and auto-snapshots to Open Brain

### 4. End-of-Week Skill (BUILT — Deploy Pending)
- Skill file built 28 March
- Weekly review ritual: task closure, decision audit, WORKING-STATE.md sync, GitHub push check
- Deploy to `.claude/skills/end-of-week/SKILL.md`

## Cowork ↔ Code Workflow

**Protocol established 28 March:**
- **Cowork** = orchestration, planning, reviews, document creation, multi-tool workflows
- **Code** = complex builds (skills, edge functions, code repos, deployments)
- **Bridge:** All Code sessions must capture outcomes to Open Brain before closing + create EOD.md handoff if GlobalContext files changed

## Key References

| Resource | URL/Location |
|----------|-------------|
| Open Brain Extensions plan | OpenBrainDev/open-brain-extensions-plan.md |
| openbrain-views repo | https://github.com/kagisok-pin/openbrain-views |
| Live app | https://openbrain-views.vercel.app |
| NemoClaw GitHub | https://github.com/NVIDIA/NemoClaw |
| NemoClaw docs | https://docs.nvidia.com/nemoclaw/latest/ |
| NVIDIA API key | https://build.nvidia.com |
| 724-Office reference | https://github.com/wangziqi06/724-office |
| OpenClaw official | https://openclaw.ai |

## Dependencies

- NemoClaw sprint depends on Hetzner ID verification
- Staff KB project (Institutional Capacity) depends on sprint learnings
- Open Brain Extensions Phase 1 edge functions need Supabase work (Code session)
