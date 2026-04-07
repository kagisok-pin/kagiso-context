# Sales Tech Stack — Project Context

**Created:** 2026-03-28
**Entity:** Pinnacle Stone (primary), Nolte Sandton (future)
**Status:** Active — Phase 1 starting immediately

---

## What This Is

A phased programme to build a working revenue engine that connects marketing → CRM → fulfilment for Pinnacle Stone. Previously tracked as 4 separate initiatives in Open Brain — now consolidated into one coherent programme.

## Strategic Context

Pinnacle Stone's sales process is currently fragmented:
- **CRM:** HubSpot (committed, do not re-evaluate until 2028)
- **ERP:** Cin7 Core (inventory, production orders)
- **Automation:** Make.com Pro plan
- **Prospecting:** Was in Notion, archived during workspace audit (17 March 2026). HubSpot is now sole CRM.
- **Production Orders:** Actively maintained in Notion (updated daily), but should eventually be driven from Cin7

The Notion workspace audit (17 March) stripped all prospecting content from Notion and confirmed HubSpot as the CRM source of truth. This created an immediate gap: there's no structured prospecting or lead management process in HubSpot yet.

## The 3-Phase Programme

### Phase 1: HubSpot Foundation (Start: Immediately)
**Goal:** Get lead management working properly in HubSpot before adding AI layers.

Scope:
- Audit current lead management process in HubSpot
- Research and document lead management best practices for B2B stone distribution
- Map marketing channel integrations with HubSpot (website forms, email, WhatsApp, social)
- Design improved lead management process
- Create list of potential automation workflows (Make.com → HubSpot)
- Implement basic lead scoring and pipeline stages
- Configure deal stages to match Pinnacle Stone's actual sales cycle

Key constraint: Pinnacle Stone is B2B — customers are fabricators, developers, designers, architects, and retail chains. Lead management must account for long sales cycles and relationship-driven selling.

Open Brain references:
- "I need to improve our lead management process and find useful automations that link leads from our marketing channels to our hubspot" (captured 6 March)

### Phase 2: AI-Powered Prospecting & SDR (Target: April 2026)
**Goal:** Build AI-assisted prospecting and outreach capability.

Scope:
- AI SDR implementation planning (original deadline end of March — missed, reset to April)
- AI prospecting engine to replace manual Notion-based tracking
- Integration with HubSpot as source of truth
- Automated prospect research and scoring
- Templated outreach with personalisation
- Follow-up cadence automation

Open Brain references:
- "Build an AI-powered prospecting engine for Pinnacle Stone" (captured 17 March, target start ~14 April)
- "AI SDR Implementation Planning — planning phase must be complete within next two weeks" (captured 15 March)

### Phase 3: Full Integration (2027)
**Goal:** Connect Cin7 → HubSpot → Make.com for end-to-end customer journey visibility.

Scope:
- Make.com as integration layer between Cin7 (inventory/production) and HubSpot (CRM/pipeline)
- Production Orders driven from Cin7, not manually maintained in Notion
- Operational visibility: order status, inventory levels, delivery tracking visible in CRM
- Customer journey mapping: first touch → quote → order → production → delivery → follow-up

Open Brain references:
- "Restart/start work on the Make-Cin7-HubSpot customer journey integration project" (captured 17 March)

## People

| Person | Role | Relevance |
|--------|------|-----------|
| Kagiso Komane | MD / Co-Founder | Programme owner, primary decision-maker |
| Wanela Komane | Financial Director / Co-Founder | Strategic stakeholder, finance integration |
| Amy Abbott/Pienaar | Acting Sales Lead (30-day trial from March 2026) | Key HubSpot user, sales process design |
| Sydney Bonongo | Operations Manager | Cin7 operations, relevant for Phase 3 integration |
| Dieketseng Mthimkhulu | Sales & Office Admin | Cin7 key user, job-card management, operational link between ERP and CRM |
| Amorette | RM (GP) | Sales process user, HubSpot adoption |
| Katlego Nesengani | RM (GP) | Sales process user, HubSpot adoption |
| Zinhle Myeza | RM (LP) | Sales process user (Polokwane) |
| Nkululeko Ncube | RM (LP) | Sales process user (Polokwane) |

## Key Systems

| System | Role | Notes |
|--------|------|-------|
| HubSpot | CRM — source of truth | Committed until 2028. Do not re-evaluate. |
| Cin7 Core | ERP — inventory, production | Currently disconnected from HubSpot |
| Make.com | Automation layer | Pro plan. Connects systems. |
| Notion | Production Orders DB | Actively used but should migrate to Cin7 |

## Dependencies

- Phase 1 has no blockers — can start immediately
- Phase 2 depends on Amy Abbott trial outcome (sales lead role clarity)
- Phase 3 depends on Phase 1 completion and Cin7 API readiness

## Success Metrics

- Phase 1: Lead-to-deal conversion rate measurable in HubSpot; marketing channel attribution working
- Phase 2: AI-generated prospects entering pipeline weekly; automated follow-up cadence running
- Phase 3: Order status visible in HubSpot; Notion Production Orders DB retired
