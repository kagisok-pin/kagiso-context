# Acquisitions — Project Context

**Created:** 2026-03-28
**Entity:** Arc & Mantle
**Status:** Active — Kamen DD required before 9 April visit

---

## What This Is

Acquisition evaluation and due diligence for potential additions to the Arc & Mantle portfolio. Currently one active target (Kamen Marble & Granite) and one killed idea (carpentry business).

## Active: Kamen Marble & Granite

### Overview
A sale agreement for Kamen Marble & Granite surfaced on 2026-03-10. Share sale at R5,000,000 (R250,000 deposit, balance by 09 June 2026). Kamen is approximately 90% fabricator, 10% distributor.

### Strategic Significance
This triggers the early-review clause in the Fabrication Parked decision (decision-log.md, 3 March 2026): "Earlier review triggered if: compelling acquisition opportunity arises."

Fabrication was parked until Q1 2028 minimum. Kamen forces a re-evaluation of that timeline — but only if the DD supports it.

### Key Strategic Considerations
1. **Channel conflict:** Pinnacle Stone's core B2B customers ARE fabricators. Owning a competing fabricator requires strict brand firewall and operational separation.
2. **Management bandwidth:** Kagiso is already running Pinnacle Stone transition + Nolte + JD reviews + Sales OS. A third OpCo is material complexity.
3. **Share sale risk:** Share sale structure inherits ALL liabilities (tax, labour, environmental, contractual). Strong recommendation to negotiate asset purchase instead if proceeding.
4. **Go/No-Go gates:**
   - (a) Can fabrication be firewalled from distribution without losing B2B customers?
   - (b) Is there a credible operator to run day-to-day? (Kagiso cannot run three businesses)
   - (c) Does R5M pass the 18-month payback test?

### DD Tools Available
Three DD skill sets installed in Claude:
1. Anthropic PE skills (dd-meeting-prep, value-creation-plan, ic-memo)
2. Deep-Research skill
3. Custom SA SME Acquisition DD skill (covers CIPC, SARS, BEE, COIDA, silica dust regulations, share sale vs asset purchase, valuation frameworks)

Skills location: `ClaudeSpace/skills-library/` (source of truth; deployed copies in `.claude/skills/` per project)

### Timeline
| Date | Milestone |
|------|-----------|
| 10 Mar | Sale agreement surfaced |
| 17 Mar | DD planning documented, skills installed |
| 28 Mar | Strategic fit assessment still NOT completed |
| **9 Apr** | **In-person visit to Kamen's business** |
| 9 Jun | Balance payment deadline (if proceeding) |

### Immediate Next Steps (Before 9 April)
1. Run `/dd-strategic-fit` for Kamen — this is the gate that determines whether DD proceeds
2. Generate information request letter (documents to request from Kamen before/during visit)
3. CIPC company search — verify entity details, directors, compliance status
4. Deep research on Kamen's market position, reputation, customer base
5. Prepare meeting agenda and questions for the 9 April visit
6. Update decision-log.md with early review status

### Visit Prep Checklist (9 April)
- [ ] Strategic fit assessment complete
- [ ] Information request letter sent (or brought to meeting)
- [ ] CIPC search done
- [ ] Key questions prepared (financials, staff, equipment, customers, liabilities)
- [ ] Valuation framework ready (R5M against revenue, EBITDA, asset value)
- [ ] Share sale vs asset purchase brief prepared for negotiation

## Killed: Carpentry Business Acquisition
**Date killed:** 2026-03-28
**Original idea:** Acquire a carpentry business as a hedge against overseas supplier risk (import dependency on stone/ceramic and German kitchen components).
**Kill reason:** No research conducted, no operator identified, no thesis beyond "risk mitigation", no capacity to pursue. Too speculative for current bandwidth. Revisit only if a specific opportunity presents itself with an operator attached.

## Standing Principles for Acquisitions
From decision-log.md and Arc & Mantle strategy:
- Fabrication is parked until Q1 2028 minimum (Kamen triggers early-review, not automatic approval)
- Any acquisition must pass: strategic fit, operator availability, 18-month payback, brand firewall test
- Prefer asset purchase over share sale for SA SMEs (liability inheritance risk)
- New OpCos require a dedicated operator — Kagiso does not run day-to-day
