---
name: design-review
description: "Review design documents for coherence, completeness, and alignment with project principles. Use after GDDs, UX specs, or design system updates are drafted."
argument-hint: "[file or 'all']"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write
model: minimax/MiniMax-M2.7
---

# /design-review — Design Document Review

Review design documents for coherence and completeness.

## Phase 1: Identify Documents to Review

- If `all`: review all files in `docs/design/` and `docs/game/gdd/`
- If specific file: review that file
- Check the file exists and has content

## Phase 2: Review Structure

For each document, check:
- **Completeness**: All required sections are filled
- **Coherence**: Sections don't contradict each other
- **Actionability**: Each section gives implementers enough to work with
- **Consistency**: Terminology is consistent, no unexplained jargon

## Phase 3: Check Design Principles

For design documents, verify:
- **Pillar alignment**: Does this serve the stated design principles?
- **MDA alignment**: Is the target aesthetic clearly stated?
- **User alignment**: Is the target user clearly defined?

## Phase 4: Findings Summary

```markdown
## Design Review — [Document Name]

| Section | Status | Notes |
|---------|--------|-------|
| [Section 1] | OK / Needs Work | [Notes] |
| [Section 2] | OK / Needs Work | [Notes] |

### Must Fix
- [Issue 1] — [Why it matters]

### Should Fix
- [Issue 1] — [Why it matters]

### Good
- [What's working well]
```

## Phase 5: Report

Present findings. If there are blocking issues:
```
"May I write a review report to docs/design/reviews/review-[YYYY-MM-DD].md?"

Options:
  [A] Yes — write it
  [B] Discuss findings first
  [C] Skip review
```