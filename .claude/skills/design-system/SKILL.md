---
name: design-system
description: "Create or evolve the design system — design principles, UI patterns, component standards, and visual language. Use this to establish design guardrails for the project."
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, WebSearch
model: minimax/MiniMax-M2.7
---

# /design-system — Design System

Establish and document the design system for the project.

## Phase 1: Check Existing

Check if a design system already exists:
- `docs/design/design-system.md`
- `docs/design/principles.md`
- `docs/design/visual-language.md`

If exists, ask: "A design system already exists. Update or extend it, or start fresh?"

## Phase 2: Design Principles

Define 3-5 design principles that:
1. Create meaningful tension with each other
2. Could resolve a design disagreement in practice
3. Differentiate from closest comparables

```markdown
## Design Principles

### Principle 1: [Name]
**Definition**: [One sentence — what this principle means]

**Design Test**: [If we're debating between X and Y, this principle says we choose ___]

**Example**: [How this principle applies in practice]
```

## Phase 3: Component Standards

Define the core UI components and their states:

```markdown
## Component Standards

### Button
**States**: default, hover, active, disabled, loading
**Variants**: primary, secondary, ghost, danger
**Sizes**: sm, md, lg

### Input
**States**: default, focus, error, disabled, success
**Types**: text, email, password, number

### Card
**Variants**: default, elevated, bordered
**Slots**: header, body, footer, media
```

## Phase 4: Spacing & Typography

```markdown
## Spacing System

Base unit: [X]px
Scale: 4, 8, 12, 16, 24, 32, 48, 64, 96

## Typography

**Font**: [Primary font]
**Scale**:
- H1: [size]/[line-height] — [weight]
- H2: [size]/[line-height] — [weight]
- Body: [size]/[line-height] — [weight]
- Caption: [size]/[line-height] — [weight]
```

## Phase 5: Color System

```markdown
## Color System

### Primary
- Brand: [hex]
- Primary: [hex]
- Primary hover: [hex]

### Semantic
- Success: [hex]
- Warning: [hex]
- Error: [hex]
- Info: [hex]

### Neutral
- Background: [hex]
- Surface: [hex]
- Border: [hex]
- Text primary: [hex]
- Text secondary: [hex]
```

## Phase 6: Motion & Animation

```markdown
## Motion Philosophy

[How animation serves the product — e.g., "Motion confirms action, never decorates"]

**Duration scale**: 100ms (micro), 200ms (standard), 300ms (emphasis), 500ms (dramatic)

**Easing**: ease-out for entries, ease-in for exits
```

## Phase 7: Accessibility

```markdown
## Accessibility Standards

- Contrast ratio: 4.5:1 minimum (AA)
- Focus indicators: visible on all interactive elements
- Keyboard navigation: full app navigable via keyboard
- ARIA: semantic roles, labels on interactive elements
- Motion: respects prefers-reduced-motion
```

## Phase 8: Write and Confirm

```
Present the design system. Ask:
"May I write this to docs/design/design-system.md?"

Options:
  [A] Yes — write it
  [B] Revise section [X]
```

After approval, write the file and update `docs/design/` index.