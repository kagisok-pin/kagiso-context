-- Open Brain Cleanup Script — 2026-03-16
-- Run in Supabase SQL Editor
-- Review each section before executing. Each block is independent.
-- BACK UP YOUR thoughts TABLE FIRST:
--   CREATE TABLE thoughts_backup_20260316 AS SELECT * FROM thoughts;

-- ============================================================
-- 1. EXACT DUPLICATES (keep the more detailed version)
-- ============================================================

-- Sarah consulting duplicate (exact copy)
DELETE FROM thoughts
WHERE content LIKE '%Sarah mentioned she''s thinking about leaving her job%'
AND id NOT IN (
  SELECT id FROM thoughts
  WHERE content LIKE '%Sarah mentioned she''s thinking about leaving her job%'
  ORDER BY created_at ASC
  LIMIT 1
);

-- OpenClaw learning sprint (shorter duplicate — keep the detailed one with Peter Steinberger)
DELETE FROM thoughts
WHERE content LIKE '%LEARNING SPRINT — OpenClaw%'
AND content NOT LIKE '%Peter Steinberger%';

-- Stone veneer suppliers (idea duplicate of the task)
DELETE FROM thoughts
WHERE content LIKE '%stone veneer suppliers%'
AND metadata->>'type' = 'idea';

-- Sydney 90-day improvement plan (keep the one mentioning compliance)
DELETE FROM thoughts
WHERE content LIKE '%improving my middle management team%'
AND content NOT LIKE '%compliant with local legislation%';

-- ============================================================
-- 2. STALE / COMPLETED TASKS
-- ============================================================

-- Grievance meeting notice delivery (11 March — event passed)
DELETE FROM thoughts
WHERE content LIKE '%Grievance Meeting Notice%'
AND content LIKE '%hand-delivered to PT%';

-- "Learn Open Brain" meta-task (done — you're using it daily)
DELETE FROM thoughts
WHERE content LIKE '%I need to learn Open Brain and use it daily%';

-- ============================================================
-- 3. NOW REDUNDANT WITH GLOBALCONTEXT (3/6/2026 bulk seed)
-- These are static reference material that now lives in trimmed
-- GlobalContext files. Keeping them pollutes semantic search.
-- ============================================================

-- Static observations about tech stack (now in profile-kagiso.md)
DELETE FROM thoughts WHERE content LIKE '%Kagiso''s personal capture and AI stack%';
DELETE FROM thoughts WHERE content LIKE '%Kagiso''s automation and integration stack%';
DELETE FROM thoughts WHERE content LIKE '%Kagiso''s business operations stack%';
DELETE FROM thoughts WHERE content LIKE '%Kagiso''s Microsoft-first productivity stack%';

-- Static observations about people/org (now in people-org.md)
DELETE FROM thoughts WHERE content LIKE '%Pinnacle Stone target org structure%' AND metadata->>'type' = 'observation';
DELETE FROM thoughts WHERE content LIKE '%Sharlene Bailey resigned from Pinnacle Stone%' AND metadata->>'type' = 'observation';

-- Static observations about strategic decisions (now in decision-log.md)
DELETE FROM thoughts WHERE content LIKE '%Strategic Decision — HubSpot Commit%' AND metadata->>'type' = 'observation';
DELETE FROM thoughts WHERE content LIKE '%Strategic Decision — Marketing Outsource-First%' AND metadata->>'type' = 'observation';
DELETE FROM thoughts WHERE content LIKE '%Strategic Decision — Fabrication Parked%' AND metadata->>'type' = 'observation';
DELETE FROM thoughts WHERE content LIKE '%Strategic Decision — Brand Firewall%' AND metadata->>'type' = 'observation';
DELETE FROM thoughts WHERE content LIKE '%Strategic Decision — Sydney Bonongo%' AND metadata->>'type' = 'observation';
DELETE FROM thoughts WHERE content LIKE '%Strategic Decision — Amy Abbott 30-day trial%' AND metadata->>'type' = 'observation';

-- Static observations about business structure (now in business files)
DELETE FROM thoughts WHERE content LIKE '%Arc & Mantle is the holding group and platform entity%';
DELETE FROM thoughts WHERE content LIKE '%Arc & Mantle target holding structure%';
DELETE FROM thoughts WHERE content LIKE '%Arc & Mantle current state: two-pillar model%';
DELETE FROM thoughts WHERE content LIKE '%Arc & Mantle future expansion pipeline%';
DELETE FROM thoughts WHERE content LIKE '%Pinnacle Stone brand portfolio%' AND metadata->>'type' = 'observation';
DELETE FROM thoughts WHERE content LIKE '%Pinnacle Stone was founded in late 2020%' AND metadata->>'type' = 'observation';
DELETE FROM thoughts WHERE content LIKE '%Pinnacle Stone revenue trajectory%';
DELETE FROM thoughts WHERE content LIKE '%Pinnacle Stone Polokwane branch%' AND metadata->>'type' = 'observation';
DELETE FROM thoughts WHERE content LIKE '%Pinnacle Stone core systems%' AND metadata->>'type' = 'observation';
DELETE FROM thoughts WHERE content LIKE '%Pinnacle Stone key project wins%';
DELETE FROM thoughts WHERE content LIKE '%Pinnacle Stone target customer segments%';
DELETE FROM thoughts WHERE content LIKE '%Nolte Kitchens Sandton is a standalone strategic pillar%';
DELETE FROM thoughts WHERE content LIKE '%Nolte Kitchens Sandton is a luxury German kitchen showroom%' AND metadata->>'type' = 'reference';
DELETE FROM thoughts WHERE content LIKE '%Nolte Kitchens Sandton target market%';
DELETE FROM thoughts WHERE content LIKE '%Nolte Kitchens Sandton supplier%' AND metadata->>'type' = 'reference';
DELETE FROM thoughts WHERE content LIKE '%Nolte Kitchens Sandton competitive positioning%';
DELETE FROM thoughts WHERE content LIKE '%Nolte Kitchens Sandton 4-pillar positioning%';

-- Static observations about Kagiso (now in profile-kagiso.md)
DELETE FROM thoughts WHERE content LIKE '%Kagiso Komane is Managing Director and founder-operator%' AND metadata->>'type' = 'reference';
DELETE FROM thoughts WHERE content LIKE '%Kagiso''s decision philosophy%' AND metadata->>'type' = 'observation';
DELETE FROM thoughts WHERE content LIKE '%Kagiso''s core operating principle%' AND metadata->>'type' = 'observation';
DELETE FROM thoughts WHERE content LIKE '%Kagiso was diagnosed with ADHD%' AND metadata->>'type' = 'observation';
DELETE FROM thoughts WHERE content LIKE '%Kagiso''s ADHD operating system%' AND metadata->>'type' = 'observation';
DELETE FROM thoughts WHERE content LIKE '%Kagiso uses named internal AI personas%' AND metadata->>'type' = 'observation';
DELETE FROM thoughts WHERE content LIKE '%Kagiso''s wife is Financial Director%' AND metadata->>'type' = 'observation';
DELETE FROM thoughts WHERE content LIKE '%Kagiso''s communication preferences%' AND metadata->>'type' = 'person_note';
DELETE FROM thoughts WHERE content LIKE '%Founder capacity risk%' AND metadata->>'type' = 'observation';
DELETE FROM thoughts WHERE content LIKE '%SSOT (Single Source of Truth) discipline%';

-- Static market/competitive observations (now in environment-market.md)
DELETE FROM thoughts WHERE content LIKE '%Four competitive threats to monitor%' AND metadata->>'type' = 'observation';
DELETE FROM thoughts WHERE content LIKE '%Five industry trends relevant to Pinnacle%' AND metadata->>'type' = 'observation';
DELETE FROM thoughts WHERE content LIKE '%Five South African operating environment challenges%' AND metadata->>'type' = 'observation';
DELETE FROM thoughts WHERE content LIKE '%South African market sizing estimates%' AND metadata->>'type' = 'observation';

-- Duplicate brand firewall observation (already covered above + in GlobalContext)
DELETE FROM thoughts WHERE content LIKE '%Brand firewall rule: Nolte Kitchens Sandton and Pinnacle Stone%';

-- Duplicate discount/commission observations (now in people-org.md)
DELETE FROM thoughts WHERE content LIKE '%Pinnacle Stone discount guardrail structure%' AND metadata->>'type' = 'observation';
DELETE FROM thoughts WHERE content LIKE '%Team Profit-Plus%' AND metadata->>'type' = 'observation';
DELETE FROM thoughts WHERE content LIKE '%Pinnacle Stone grade structure%' AND metadata->>'type' = 'observation';

-- Stosa counter-strategy (now in business-nolte-sandton.md)
DELETE FROM thoughts WHERE content LIKE '%Nolte Kitchens Sandton Stosa counter-strategy%' AND metadata->>'type' = 'idea';

-- ============================================================
-- EXPECTED RESULT: ~45-50 thoughts removed
-- Remaining: ~52-57 thoughts — all dynamic/operational content
-- ============================================================
