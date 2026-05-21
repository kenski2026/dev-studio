---
name: start
description: "Guided project onboarding — from zero idea to structured project plan. Detects project stage and guides you to the right workflow."
argument-hint: "[app|game] or 'open' for no preference"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, WebSearch
model: minimax/MiniMax-M2.7
---

# /start — Project Onboarding

Welcome to DevStudio. This guided workflow helps you set up a new project
from scratch or adopt an existing one.

## Phase 1: Project Type

**What are you building?**

```
Ask the user to select one of:
  [A] App / SaaS — Web or mobile application product
  [B] Game — Interactive entertainment (2D, 3D, mobile, PC)
  [C] API / Backend — Server-side service or tool
  [D] Other — Something that doesn't fit the above
```

## Phase 2: Stage Detection

After selecting project type, check what already exists in the workspace:

```
Check for existing files:
- .claude/agents/         → Existing project — run /onboard instead
- SPEC.md                 → Spec exists — jump to architecture
- src/ or lib/            → Code exists — adopt and continue
- docs/                   → Docs exist — read them first
- Nothing                 → Fresh start — begin guided setup
```

## Phase 3: Creative Brief (for new projects)

**For Apps:**
- What's the core problem you're solving?
- Who's the target user?
- What's the primary metric of success?
- What's your timeline and budget?

**For Games:**
- What moment in a game genuinely moved you or made you lose track of time?
- What's a fantasy or power trip you've always wanted in a game?
- What 3 games have you spent the most time with? What kept you coming back?
- What's your realistic development timeline?

## Phase 4: Project Type Setup

**For App/SaaS:**
1. Run `/spec` to create the product specification
2. Run `/design-system` to define design principles
3. Run `/sprint-plan` to plan the first sprint

**For Game:**
1. Run `/brainstorm` to develop the game concept
2. Run `/design-system` to define design pillars
3. Run `/architecture-decision` to choose the engine

**For API:**
1. Define the core API surface — what problems does it solve?
2. Run `/architecture-decision` to design the system
3. Plan sprints with `/sprint-plan`

## Phase 5: Directory Structure

Create the project structure based on type:

**App Structure:**
```
docs/
  product/       — Roadmap, positioning, business model
  design/        — Principles, UX specs, visual language
  architecture/  — ADRs, system diagrams
  production/    — Milestones, sprints, risks
src/
  components/    — UI components
  services/      — API clients, business logic
  hooks/         — Reusable custom hooks
  pages/         — Route/page components
tests/
  unit/
  integration/
  e2e/
```

**Game Structure:**
```
docs/
  game/          — GDDs, system specs
  design/        — Art bible, UX specs
  architecture/   — Technical design
  production/     — Milestones, sprints
src/
  gameplay/      — Game mechanics
  engine/        — Engine-specific code
  ui/            — Menus, HUD
  resources/     — Assets, data
tests/
  gameplay/      — Mechanic tests
  integration/   — System tests
```

## Phase 6: Initial Commit

Create the initial project setup:

```bash
git init
git add CLAUDE.md .claude/ docs/ SPEC.md
git commit -m "Initial project setup — DevStudio template"
```

## Phase 7: Next Steps

Present the user with their next steps based on project type:

**For App:**
1. Run `/spec [app name]` to create detailed product spec
2. Run `/brainstorm` if you want creative exploration
3. Run `/architecture-decision` to design the system

**For Game:**
1. Run `/brainstorm` to develop game concept
2. Run `/design-system` to define design pillars
3. Run `/architecture-decision` to choose the engine

---

**After setup completes**, save the project context to `docs/product/project-context.md`:
- Project type and description
- Target users and key metrics
- Timeline and constraints
- First milestone and success criteria