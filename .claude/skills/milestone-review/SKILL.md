---
name: milestone-review
description: "Review milestone readiness — check all acceptance criteria, open issues, and test results. Use before declaring a milestone complete or before a release."
argument-hint: "[milestone name or 'current']"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write
model: minimax/MiniMax-M2.7
---

# /milestone-review — Milestone Readiness Review

Review milestone readiness before declaring it complete.

## Phase 1: Identify Milestone

- If provided: use that milestone
- If `current`: find the most recent milestone file
- Check `docs/production/milestones.md` for milestone definitions

## Phase 2: Collect Milestone Context

1. Read the milestone definition (scope, goals, acceptance criteria)
2. Read the sprint plans that contributed to this milestone
3. Check the backlog for completed vs. open items in this milestone
4. Check for any known issues or blockers

## Phase 3: Acceptance Criteria Check

For each acceptance criterion:

```markdown
## Acceptance Criteria

| Criterion | Status | Evidence |
|-----------|--------|----------|
| [Criterion 1] | DONE / PARTIAL / NOT DONE | [File/link showing completion] |
| [Criterion 2] | DONE / PARTIAL / NOT DONE | [File/link showing completion] |
```

## Phase 4: Open Issues

```markdown
## Open Issues

| Issue | Severity | Impact | Resolution |
|-------|----------|--------|------------|
| [Bug/issue] | P0/P1/P2 | [Blocks/Degrades/Minor] | [Fix/Accept/Defer] |
```

## Phase 5: Test Results Summary

```markdown
## Test Results

| Test Type | Coverage | Pass Rate | Status |
|-----------|----------|-----------|--------|
| Unit | [X]% | [Y]% | PASS/FAIL |
| Integration | [X] tests | [Y]% | PASS/FAIL |
| E2E | [X] paths | [Y]% | PASS/FAIL |
| Smoke | [X] tests | [Y]% | PASS/FAIL |
```

## Phase 6: Overall Assessment

```markdown
## Milestone Review — [Milestone Name]

**Overall Status**: READY TO SHIP / NOT READY / CONDITIONAL

### What's Done
- [List completed items]

### What's Not Done (blockers)
- [List blocking items with owner and ETA]

### What's Not Done (acceptable)
- [List acceptable deferrals with rationale]
```

## Phase 7: Decision

```
Present the review. Ask:
"May I write this review to docs/production/milestone-reviews/review-[YYYY-MM-DD].md?"

Options:
  [A] Yes — write and mark milestone as complete
  [B] Not ready — resolve [items] first
  [C] Conditional — ship with known issues documented
```