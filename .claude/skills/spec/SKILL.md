---
name: spec
description: "Create a comprehensive product specification document (SPEC.md). Use this when starting a new app, SaaS, or any product that needs a structured spec before development begins."
argument-hint: "[app name or description]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, WebSearch
model: minimax/MiniMax-M2.7
---

# /spec — Product Specification

Create a comprehensive product specification from a product brief.

## Phase 1: Understand the Product

**Ask the user:**
1. What's the product called?
2. What problem does it solve?
3. Who's the target user?
4. What's the primary metric of success?
5. What's the revenue model (if any)?

If the user gave an argument, use it as a starting point. Otherwise, ask questions.

## Phase 2: Product Concept

Write the product concept section:

```markdown
## Product Concept

### Elevator Pitch
[1-2 sentences — what it is and who it's for]

### Core Value Proposition
[What unique value does this deliver? What changes for the user?]

### Target Users
[Primary user type]: [description]
[Secondary user type]: [description]

### Success Metrics
- [Metric 1]: [How we'll measure it]
- [Metric 2]: [How we'll measure it]

### Revenue Model
[Pricing model, target ARPU, conversion funnel]
```

## Phase 3: User Stories

Define the top 5-8 user stories:

```markdown
## User Stories

### [Story 1] — Priority: P0
**As a:** [user type]
**I want to:** [action]
**So that:** [benefit]

**Acceptance Criteria:**
- [ ] [Observable, testable criterion]
- [ ] [Observable, testable criterion]

### [Story 2] — Priority: P0/P1
...
```

## Phase 4: Feature List

List all features with priority:

```markdown
## Features

### P0 — MVP (Must have)
- [ ] [Feature 1]
- [ ] [Feature 2]
- [ ] [Feature 3]

### P1 — Post-MVP (Should have)
- [ ] [Feature 4]
- [ ] [Feature 5]

### P2 — Future (Nice to have)
- [ ] [Feature 6]
```

## Phase 5: User Flow

Map the primary user flow:

```markdown
## Primary User Flow

[ASCII flow diagram]

### Steps:
1. [Step description]
2. [Step description]
3. [Step description]

### Key Decision Points:
- [When user reaches X, they choose A or B]
- [Branch outcomes]
```

## Phase 6: Data Model

Sketch the core data model:

```markdown
## Data Model

### Users
- id: uuid
- email: string
- created_at: timestamp

### [Other entities...]
```

## Phase 7: Tech Stack Recommendation

Based on the product requirements, recommend a tech stack:

```markdown
## Tech Stack

### Frontend
[Framework]: [Rationale]

### Backend
[Framework]: [Rationale]

### Database
[Database type]: [Rationale]

### Infrastructure
[Hosting/deployment]: [Rationale]

### Key Services
- [Service]: [Purpose]
```

## Phase 8: Open Questions

List any unresolved questions:

```markdown
## Open Questions

1. [Question]: [What's blocked]
2. [Question]: [What's blocked]
```

## Phase 9: File Write

Get approval before writing:

```
Present the full spec to the user. Ask:
"May I write this to SPEC.md?"

Options:
  [A] Yes — write it
  [B] Not yet — revise section [X]
  [C] Something else — I'll describe
```

After user approves, write to `SPEC.md` in the workspace root.