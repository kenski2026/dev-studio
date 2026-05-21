---
name: scope-check
description: "Assess current project scope against original plan. Identify scope creep, forgotten items, and scope reduction opportunities. Use before milestone reviews or when feeling behind."
user-invocable: true
allowed-tools: Read, Glob, Grep, Write
model: minimax/MiniMax-M2.7
---

# /scope-check — Scope Assessment

Assess current project scope against the original plan.

## Phase 1: Gather Context

1. Read `SPEC.md` and `docs/product/backlog.md` (if they exist)
2. Read the current sprint plan (`docs/product/sprints/`)
3. Check milestones (`docs/production/milestones.md`)
4. List all files in `src/` or project root to see what's been built

## Phase 2: Compare Scope

Build a comparison table:

```markdown
## Scope Comparison

| Item | Planned | Current Status | Delta |
|------|---------|----------------|-------|
| [Feature 1] | P0 | Done / In Progress / Not started | On track / Behind / Ahead |
| [Feature 2] | P0 | Done / In Progress / Not started | On track / Behind / Ahead |
```

## Phase 3: Identify Issues

**Scope creep detected** (new items added):
```markdown
## New Items Not in Original Plan
- [Item]: [Who requested], [When], [Priority]
- Impact: [+X hours/+X days]
```

**Forgotten items** (planned but not started):
```markdown
## Forgotten / Deferred Items
- [Item]: Was P[N], [reason not started]
```

**Over-scoped items** (took more than estimated):
```markdown
## Over-Scoped Items
- [Item]: Estimated [X], Actual [Y], [reason]
```

## Phase 4: Mitigation Options

```markdown
## Mitigation Options

### Option A: Cut scope
- Cut: [Items to remove]
- Impact: [What the user loses]
- Saves: [X hours/days]

### Option B: Extend timeline
- Extend by: [X days/weeks]
- Impact: [Milestone shift]
- Cost: [Trade-off]

### Option C: Add resources
- What: [More hours, external help]
- Cost: [Money/time]
- Risk: [Coordination overhead]
```

## Phase 5: Recommendation

```
Present findings. Ask:
"Which mitigation option do you prefer?"

Options:
  [A] Cut scope — remove [items]
  [B] Extend timeline — [new date]
  [C] Add resources — [what]
  [D] Something else — I'll describe
```

After user decides, update `docs/product/backlog.md` and `docs/production/milestones.md` with the adjusted plan.