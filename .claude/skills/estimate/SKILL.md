---
name: estimate
description: "Estimate effort for user stories and features. Use story points, ideal days, or t-shirt sizes to communicate scope."
argument-hint: "[story or feature name]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write
model: minimax/MiniMax-M2.7
---

# /estimate — Effort Estimation

Estimate the effort for user stories or features.

## Phase 1: Identify What to Estimate

- If provided as argument: use that
- If not: ask the user to point to a backlog file or describe the feature

## Phase 2: Understand the Scope

Ask clarifying questions:
1. What's the full scope of this feature?
2. Are there any dependencies (external services, other features)?
3. Any technical unknowns or risky areas?
4. Is there a reference implementation in another codebase?

## Phase 3: Choose Estimation Scale

Use **story points** (Fibonacci: 1, 2, 3, 5, 8, 13) unless the user prefers otherwise:

| Points | Meaning | Rough Time |
|--------|---------|------------|
| 1 | Trivial — almost no work | < 2 hours |
| 2 | Small — straightforward | 2-4 hours |
| 3 | Medium — some complexity | 4-8 hours |
| 5 | Large — significant complexity | 1-2 days |
| 8 | Very large — risky or many parts | 2-4 days |
| 13 | XL — too big, split if possible | 1+ week |

## Phase 4: Estimate Each Item

For each item to estimate:

```markdown
## [Feature Name]

**Scope breakdown**:
- [Component 1]: [points]
- [Component 2]: [points]
- [Integration/testing]: [points]

**Risks**: [What could make this bigger]
**Dependencies**: [What must be done first]

**Total**: [X] points
**Confidence**: High / Medium / Low
```

## Phase 5: Present Estimates

```
Present the estimates table:

| Item | Points | Confidence | Notes |
|------|--------|------------|-------|
| [Feature 1] | [X] | High/Med/Low | [Notes] |
| [Feature 2] | [X] | High/Med/Low | [Notes] |

Total: [X] points across [N] items
```

If items are 8+ points, suggest splitting them into smaller pieces.