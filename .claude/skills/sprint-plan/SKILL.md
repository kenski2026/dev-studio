---
name: sprint-plan
description: "Create a sprint plan from the backlog. Break work into achievable sprint goals with clear acceptance criteria and success metrics."
argument-hint: "[sprint number or 'new']"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, WebSearch
model: minimax/MiniMax-M2.7
---

# /sprint-plan — Sprint Planning

Create or update a sprint plan based on the current backlog.

## Phase 1: Understand the Context

1. Read the current backlog (`docs/product/backlog.md`)
2. Check existing sprint plans (`docs/product/sprints/`)
3. Check the milestone timeline (`docs/production/milestones.md`)
4. Ask about team capacity — how many hours/week? Any availability constraints?

## Phase 2: Select Stories

Select stories from the backlog that:
1. Are priority P0 or P1
2. Have no blocked dependencies
3. Can be completed within the sprint

**Output a table:**

| # | Story | Points | Owner | Dependencies |
|---|-------|--------|-------|--------------|
| 1 | [Story name] | [points] | [role] | [deps] |
| 2 | [Story name] | [points] | [role] | [deps] |

**Total points**: [X] points
**Capacity**: [Y] points (based on team hours)
**Buffer**: [X-Y] points (for unexpected work)

## Phase 3: Define Sprint Goals

Write 2-3 sprint goals that are:
- Specific (not vague)
- Measurable (you know when you've achieved it)
- Achievable (realistic for the team)

```markdown
## Sprint [N] Goals

1. **[Goal 1]** — [What we're trying to achieve]
2. **[Goal 2]** — [What we're trying to achieve]
3. **[Goal 3]** — [What we're trying to achieve]
```

## Phase 4: Sprint Schedule

```markdown
## Sprint Schedule

**Duration**: [X] days ([Start date] — [End date])
**Scrum**: [Daily standup time]
**Review**: [Date and format]
**Retrospective**: [Date]

### Availability
- [Name]: Available [hours]/week, [constraints]
```

## Phase 5: Risk Check

```markdown
## Sprint Risks

| Risk | Impact | Mitigation |
|------|--------|------------|
| [Risk 1] | High/Med/Low | [Mitigation plan] |
```

## Phase 6: Write and Confirm

```
Present the sprint plan. Ask:
"May I write this to docs/product/sprints/sprint-[N].md?"

Options:
  [A] Yes — write it
  [B] Adjust story selection
  [C] Adjust sprint goals
```

After approval, update `docs/product/backlog.md` to mark selected stories as "In Sprint [N]".