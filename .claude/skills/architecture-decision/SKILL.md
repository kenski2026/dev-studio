---
name: architecture-decision
description: "Create an Architecture Decision Record (ADR) for significant technical choices. Use when making decisions about tech stack, patterns, infrastructure, or any cross-cutting technical concern."
argument-hint: "[decision topic]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, WebSearch
model: minimax/MiniMax-M2.7
---

# /architecture-decision — Create an ADR

Create a structured Architecture Decision Record for significant technical choices.

## Phase 1: Identify the Decision

**Ask the user:**
1. What's the technical decision being made?
2. What's the context — what's driving this decision?
3. What are the options being considered?
4. What's the constraint that's forcing the choice?

If the user gave an argument, use it as context.

## Phase 2: Context and Problem

Write the problem statement:

```markdown
# ADR-[NUMBER]: [Title]

**Status**: Proposed

**Date**: [YYYY-MM-DD]

**Context**: [The problem being solved — why is this decision necessary now?]

**Constraints**: [What's limiting the solution space]
- [Constraint 1]
- [Constraint 2]

**Goals**: [What a good solution would achieve]
- [Goal 1 — measurable]
- [Goal 2 — measurable]
```

## Phase 3: Options Analysis

Present the options under consideration:

```markdown
## Options

### Option A: [Name]
**Description**: [What this option entails]

**Pros**:
- [Advantage 1]
- [Advantage 2]

**Cons**:
- [Disadvantage 1]
- [Disadvantage 2]

**Effort**: Low / Medium / High
**Risk**: Low / Medium / High

### Option B: [Name]
...
```

## Phase 4: Decision

```markdown
## Decision

**Chosen**: [Option name]

**Rationale**: [Why this option was chosen over alternatives — cite specific goals and constraints it satisfies]

**Alternatives rejected**:
- [Option A] — [Why rejected in favor of chosen]
- [Option B] — [Why rejected in favor of chosen]
```

## Phase 5: Consequences

```markdown
## Consequences

### Positive
- [What improves with this decision]

### Negative
- [What gets harder or more complicated]

### Neutral
- [What changes without being clearly good or bad]
```

## Phase 6: Implementation

```markdown
## Implementation

**Tech stack**: [Languages, frameworks, versions chosen]

**Affected systems**:
- [System 1] — [What changes]
- [System 2] — [What changes]

**Migration plan**: [How to transition from current state to new]

**Rollback plan**: [How to revert if this decision proves wrong]
```

## Phase 7: Approval

```
Present the ADR. Ask:
"May I write this to docs/architecture/adr-[NUMBER]-[slug].md?"

Options:
  [A] Yes — write it
  [B] Revise section [X]
  [C] Need more analysis first
```

After approval, update `docs/architecture/adr-index.md` with the new ADR.