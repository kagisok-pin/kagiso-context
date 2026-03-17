# Weekly Review Prompt

**When:** Monday AM (block 15 min)
**Where:** Any MCP-connected AI tool with Open Brain access
**Output:** Updated WORKING-STATE.md draft for your review

---

## The Prompt

Copy and paste this into your AI tool each Monday:

---

```
Weekly review — refresh my WORKING-STATE.md.

Do these steps in order:

1. Query Open Brain: list_thoughts for the last 7 days (all types). Also search_thoughts for "blocker" and "waiting".

2. Check my calendar for this week and next week (14-day window).

3. Read my current WORKING-STATE.md from GlobalContext.

4. Generate an updated WORKING-STATE.md with:
   - **Top 5 priorities this week** (synthesise from Open Brain tasks + calendar + your judgement on what matters most)
   - **Active blockers / waiting-on items** (carry forward unresolved ones, add new ones, remove resolved ones)
   - **Key dates — next 14 days** (from calendar, deadlines mentioned in Open Brain, review dates from decision-log)
   - **Recent session outcomes** (last 3-5 meaningful sessions, one line each — from Open Brain captures)
   - **Temporary context flags** (anything with a near-term expiry: trials ending, deadlines approaching, time-bound initiatives)

5. Show me the draft. I'll edit before committing.

Keep it under 50 lines. Be direct — no filler.
```

---

## After Running the Prompt

1. Review the draft — adjust priorities based on your own judgement
2. Save the updated WORKING-STATE.md to your GlobalContext folder
3. Commit to GitHub if using version control
4. You're done — 15 minutes, context refreshed for the week

---

## Variations

**Quick version** (if short on time):
```
Quick WORKING-STATE refresh. Query Open Brain for last 7 days, check my calendar for the next 7 days, and update my top 5 priorities and blockers. Show me the draft.
```

**Deep version** (first Monday of month — combine with monthly prune):
```
Monthly review. List all Open Brain thoughts from the past 30 days. Flag duplicates, completed tasks, and stale items for deletion. Then do the normal weekly WORKING-STATE refresh. Also check: are any GlobalContext files out of date based on what's happened this month?
```
