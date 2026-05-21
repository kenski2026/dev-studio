---
name: brainstorm
description: "Guided product ideation — from zero idea to structured product concept. Uses professional studio techniques: Jobs-to-be-Done, contrastive analysis, and rapid validation frameworks."
argument-hint: "[product type hint, or 'open']"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, WebSearch
model: minimax/MiniMax-M2.7
---

# /brainstorm — Product Ideation

A structured ideation session for apps, SaaS products, or services.

## Phase 1: Discovery

Start by understanding the person and the problem space:

**Questions to ask:**
1. What problem are you trying to solve?
2. Who experiences this problem today? How do they cope?
3. What's your relationship to this problem? (Personal pain point? Observed in others? Market opportunity?)
4. What's your timeline and budget?

**Questions to ask as options (use Ask-style format via conversation):**
- Experience type: Challenge & Mastery / Story & Discovery / Expression & Creativity / Relaxation & Flow
- Timeline: Weeks / Months / 1-2 years / Multi-year
- Dev level: First project / Shipped before / Professional background

## Phase 2: Problem Framing

Frame the problem using **Jobs-to-be-Done**:
- "When [situation], I want to [motivation], so I can [expected outcome]"
- What functional job is being hired to do?
- What emotional job?
- What social job?

## Phase 3: Concept Generation

Generate 3 distinct concepts, each taking a different creative direction:

**Technique 1: Solution-inverted**
Start from what NOT to do, then find the inverse.

**Technique 2: Audience-first**
Start from a specific underserved audience, design backward.

**Technique 3: Outcome-first**
Start from the metric that matters most, design the system that moves it.

For each concept:
- **Working Title**: [Name]
- **Elevator Pitch**: [1-2 sentences — passes the "10-second test"]
- **Core Job**: [The functional job being done]
- **Why it wins**: [Why someone would choose this over alternatives]
- **Biggest risk**: [What's the hardest unanswered question?]
- **Scope estimate**: Small / Medium / Large

## Phase 4: Concept Selection

Present all 3 concepts, then ask the user to select one or combine elements:

```
Which concept resonates with you most?
  [A] Concept 1 — [Title]
  [B] Concept 2 — [Title]
  [C] Concept 3 — [Title]
  [D] Combine elements across concepts
  [E] Generate fresh directions
```

## Phase 5: Deep Dive

For the chosen concept, develop:

**Core Value Flow:**
```
[User Problem] → [Solution Hook] → [Key Features] → [Unique Advantage] → [Retention]
```

**Revenue Model Validation:**
- What's the pricing model? (Subscription / One-time / Freemium / Marketplace / Ads)
- What's the target ARPU?
- What's the conversion funnel?
- Is the unit economics viable at scale?

**Competitive Landscape:**
- Who are the top 3 competitors?
- What do they do well?
- What's their weakness?
- How is your approach differentiated?

**Validation Plan:**
- How would you validate this idea with $0? (Customer interviews, landing page, manual service)
- What's the fastest path to a paying customer?

## Phase 6: Document Generation

Generate a concise product brief:

```markdown
## [Product Name] — Product Brief

### Problem
[1-2 sentences on the problem being solved]

### Solution
[1-2 sentences on the core solution]

### Target User
[Primary user type and their key characteristics]

### Core Value
[The single most important value delivered]

### Revenue Model
[Pricing model and target ARPU]

### Competitive Edge
[What makes this different from alternatives]

### Validation Plan
[How to test this with minimal investment]

### Next Steps
- [ ] [Immediate next step]
- [ ] [2nd step]
- [ ] [3rd step]
```

## Phase 7: Write and Confirm

```
Present the brief. Ask:
"May I write this to docs/product/product-brief.md?"

Options:
  [A] Yes — write it
  [B] Revise a section first
  [C] Something else
```

If [B], ask which section, revise, show the diff, ask again.

After approval, write to `docs/product/product-brief.md`.