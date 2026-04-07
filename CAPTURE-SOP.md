# Capture & Maintenance SOP

**Purpose:** Personal operating procedure for maintaining the context/memory system.
**Rule of thumb:** If you're wondering whether to capture it — capture it. Open Brain is cheap. Pruning is easy. Forgetting is expensive.

---

## Daily Habits

### During AI Sessions (~1-2 min per session)

**When something meaningful happens in a session** (a decision is made, an analysis produces a key insight, a new task emerges), capture it before closing:

> "Capture to Open Brain: [one-line summary of what happened and why it matters]"

Or ask Claude to do it: "Capture the key outcomes from this session to Open Brain."

**What counts as "meaningful":**
- A decision was made (even a small one)
- A new task or action item was created
- An insight changed how you think about something
- A person-specific observation worth remembering
- A client interaction worth noting

**What doesn't need capturing:**
- Research outputs (the deliverable IS the output)
- Draft documents (they live in SharePoint/Notion)
- Anything already in GlobalContext files
- Routine conversations with no new information

### End of Day (~2 min)

Quick Slack message to Open Brain with anything significant from offline work:
- Meetings attended and key takeaways
- Decisions made in person or on calls
- Promises made to people (follow-ups, commitments)
- New information learned (market intel, competitor moves, client feedback)

**Format:** Keep it simple. One message per distinct thought. Open Brain handles the tagging.

**Entity tagging:** Start thoughts with the entity when relevant:
- "Pinnacle Stone — Amy closed the Tricolt upsell, R180k, 22% margin"
- "Nolte Sandton — Devesh started, first day went well, needs Nolte system access"
- "Personal — Kgomotso school visit scheduled for Thursday"

---

## Weekly Review (Monday AM, ~15 min)

**When:** Monday morning before first meeting. Block 15 min in calendar.

**Process:**
1. Open any MCP-connected AI tool
2. Run the weekly review prompt (see WEEKLY-REVIEW-PROMPT.md)
3. Review the auto-generated WORKING-STATE.md draft
4. Edit as needed (add your judgement — what actually matters this week?)
5. Commit to GitHub (or save to ClaudeSpace)

**What to look for during review:**
- Tasks from last week that are now done → mentally close them
- Tasks that haven't moved → either do them, delegate them, or delete them
- Blockers that resolved → update or remove
- New priorities that emerged → add them
- Dates that passed → clean up

---

## Monthly Prune (First Monday of month, ~30 min)

**Process:**
1. Run `list_thoughts` for the past 30 days — scan for:
   - Completed tasks (delete or archive)
   - Duplicates (delete the less detailed one)
   - Observations now captured in GlobalContext (delete from Open Brain)
   - Stale items nobody acted on for 30+ days (decide: act, delegate, or delete)
2. Run `thought_stats` — check top topics and people. Any surprises?
3. Check thought count — if growing faster than ~100/month, tighten capture criteria

**Target:** Open Brain should stay under ~200 active thoughts. Above that, semantic search quality starts degrading (too many near-matches diluting results).

---

## Quarterly Review (Last week of quarter, ~60 min)

**Process:**
1. Re-read all GlobalContext files
2. For each file, ask: "Is this still true? What's changed?"
3. Update facts, org charts, priorities, financial figures
4. Move any new settled decisions to decision-log.md
5. Update INDEX.md version history
6. Commit to GitHub

**Trigger questions:**
- Has anyone joined, left, or changed roles?
- Have any strategic decisions been made or reversed?
- Has the competitive landscape shifted?
- Are the "Open Strategic Questions" still the right questions?
- Is the tech stack still accurate?

---

## What Goes Where (Quick Reference)

| I just... | Capture to... |
|---|---|
| Made a strategic decision | decision-log.md |
| Learned something about a person | Open Brain (person note) |
| Got a new task or action item | Open Brain (task) |
| Had an insight or idea | Open Brain (idea) |
| Noticed something about the market/competitors | Open Brain (observation) |
| Changed an org chart, product line, or entity fact | Relevant GlobalContext file |
| Finished a meaningful AI session | Open Brain (session outcome) |
| Changed my tools or preferences | profile-kagiso.md or User Preferences |

---

## Anti-Patterns (Don't Do This)

- **Don't capture the same thing twice** — if it's already in GlobalContext, don't also put it in Open Brain
- **Don't capture raw analysis** — the document IS the deliverable; capture only the conclusion or decision
- **Don't let Open Brain become a to-do list** — it's a memory system, not a task manager. Tasks go in Sunsama
- **Don't skip the weekly review** — the system degrades within 2-3 weeks without it
- **Don't capture for future-you to "process later"** — if you can't write a clear one-liner now, it's probably not worth capturing
