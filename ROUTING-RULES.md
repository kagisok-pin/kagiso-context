# Routing Rules

**Last Updated:** 2026-03-16
**Purpose:** Single source of truth for where new information is stored across the context/memory system
**Rule:** When in doubt, capture to Open Brain. It's the lowest-friction capture point and the default destination for anything in motion.

---

## The Three Tiers

| Tier | Layer | Contents | Loaded |
|------|-------|----------|--------|
| 1 | **Always On** | User Preferences (system prompt) + INDEX.md + WORKING-STATE.md | Every session, automatically or first-read |
| 2 | **On Demand** | GlobalContext business files + Open Brain (semantic search) | When topic-relevant, one file at a time |
| 3 | **Deep Reference** | decision-log.md, environment-market.md | Only when explicitly needed |

---

## Where Does New Information Go?

### → User Preferences (system prompt)
- Tone, format, and behavioural instructions for AI tools
- Default context assumptions (geography, currency, timezone, language)
- Red lines and working-with-me rules
- **Never duplicated in GlobalContext files**

### → WORKING-STATE.md
- Current week's top 3–5 priorities
- Active blockers and waiting-on items
- Key dates in the next 14 days
- Last 3–5 session outcomes (one line each)
- Temporary context flags (e.g. "Amy trial ends 1 April")
- **Refreshed weekly** (auto-generated draft via Make, manually reviewed)

### → GlobalContext Business Files
- Structural facts about an entity (org chart, product lines, key relationships)
- Current-state descriptions (what the business does today)
- Active strategic priorities for that entity
- **Only updated when facts change** — not for WIP or tasks
- **Target: <200 lines per file**

### → decision-log.md
- Settled strategic decisions with rationale
- Options that were considered and rejected (with reasoning)
- Review dates and triggers for revisiting
- **Only written when a decision is finalised** — not for "thinking about" items

### → Open Brain (capture_thought)
- Tasks and action items
- Observations and insights from meetings, calls, sessions
- Ideas and hypotheses (not yet decisions)
- Person-specific notes ("Devesh starts 1 April", "Amy struggling with margin discipline")
- Client observations that don't fit CRM fields ("Amorette prefers sample visits over email follow-ups")
- Session outcomes worth preserving
- Anything in motion — WIP, pending, exploratory
- **Default capture destination when unsure**
- **Tag thoughts with entity context** (Pinnacle Stone / Nolte Sandton / Arc & Mantle / Personal) for filtered retrieval

---

## Entity Separation Rules

- **Load one business file at a time** unless the discussion explicitly spans entities
- Pinnacle Stone discussion → load `business-pinnacle-stone.md` only
- Nolte Sandton discussion → load `business-nolte-sandton.md` only
- Group strategy / Arc & Mantle → load `platform-arc-mantle.md` (may reference both entities)
- **Open Brain queries:** filter by entity topic tag when in a single-entity session
- **Client-specific context:** V1.0 captures client observations in Open Brain. V2.0 will integrate HubSpot MCP for CRM data retrieval — avoiding duplication between memory system and CRM.

---

## Retrieval Logic: Files vs Open Brain

| Information type | Retrieve from | Why |
|---|---|---|
| Structural facts (org chart, entity details, product lines) | GlobalContext file | Stable, loaded once, low token cost (~6K tokens per file) |
| Settled decisions and rationale | decision-log.md | Deliberate, infrequently accessed |
| Current priorities and blockers | WORKING-STATE.md | Synthesised weekly, always loaded |
| Recent events, tasks, person notes | Open Brain (semantic search) | Returns only relevant matches (~250–1,500 tokens), most token-efficient for dynamic content |
| Client history, deal status | HubSpot MCP (V2.0) | Source of truth for CRM data — don't duplicate into memory |

---

## What Does NOT Get Stored

- Drafts and working documents (live in SharePoint/Notion, not context system)
- Detailed analysis outputs (live in the deliverable, not memory)
- Duplicate information across tiers (if it's in User Preferences, it's not in profile-kagiso.md)
- Client CRM data (lives in HubSpot — will be queried via MCP in V2.0)
- Stale tasks or completed items (pruned monthly from Open Brain)

---

## Capture Habits

| When | What | Where | Time |
|------|------|-------|------|
| During AI session | Key decision, action item, or insight produced | Open Brain (capture_thought or ask Claude to capture) | 1–2 min |
| End of AI session | 1–3 sentence summary of session outcome | Open Brain (capture_thought) | 1 min |
| Daily | Anything significant from offline work (meetings, calls, decisions) | Open Brain via Slack | 2 min |
| Weekly (Mon AM) | Review + edit auto-generated WORKING-STATE.md draft | WORKING-STATE.md (commit to GitHub) | 15 min |
| Monthly | Prune Open Brain: remove stale tasks, deduplicate, archive completed | Open Brain (review via list_thoughts) | 30 min |
| Quarterly | Review all GlobalContext files for drift against actual state | All GlobalContext files | 60 min |

---

## Cross-Tool Access

| Tool | GlobalContext access | Open Brain access |
|------|---------------------|-------------------|
| Cowork / Claude Desktop | Local files or GitHub raw URLs | MCP (remote) |
| Claude Code | Local files | MCP (remote) |
| ChatGPT | GitHub raw URLs (paste or custom GPT) | MCP (if supported) or manual paste |
| Cursor / VS Code | Local files | MCP (remote or mcp-remote bridge) |

---

## Conflict Resolution

If information conflicts across tiers:
1. **WORKING-STATE.md** wins for current priorities and operational state (most recent)
2. **Open Brain** wins for recent events and person-level context (most granular)
3. **GlobalContext files** win for structural facts and entity descriptions (most stable)
4. **decision-log.md** wins for settled strategic decisions (most deliberate)
5. **User Preferences** wins for tone, format, and behavioural rules (most authoritative)

---

## V2.0 Backlog

Items flagged for the next iteration of this system:
- **HubSpot MCP integration:** Query client context, deal status, and contact history directly from HubSpot during sessions — eliminating the need to store client CRM data in Open Brain or GlobalContext
- **Session-end auto-capture:** Make automation or Slack shortcut to reduce friction on end-of-session outcome capture
- **Open Brain → GlobalContext promotion:** Process for graduating repeated Open Brain observations into permanent GlobalContext entries (e.g. if a person note becomes a structural org fact)
- **Cross-entity dashboard:** Weekly digest that pulls from both Open Brain and HubSpot to surface cross-entity patterns
- **Open Brain delete endpoint:** Add `delete_thought` Edge Function to MCP server so thoughts can be pruned via tool calls during sessions (currently requires Supabase dashboard or SQL)
- **Open Brain update endpoint:** Add `update_thought` for editing/correcting captured thoughts without delete-and-recapture
