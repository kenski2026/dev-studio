# DevStudio — AI Agent Development Studio

Turn a single OpenClaw session into a full application and game development studio.
**14 agents. 18 skills. One coordinated AI team.**

Built for MiniMax MCP — uses `sessions_spawn` for subagents, structured prompts for specialists.

---

## What You Get

| Category | Count | Description |
|----------|-------|-------------|
| **Agents** | 14 | Tier 1 Directors → Tier 2 Leads → Tier 3 Specialists |
| **Skills** | 18 | Slash commands covering full product + game dev lifecycle |
| **Hooks** | 3 | Automated validation on commits, gap detection, session recovery |
| **Rules** | 2 | Path-scoped coding standards enforced per domain |
| **Gates** | 8 | Director review checkpoints before phase transitions |

---

## Studio Hierarchy

```
Tier 1 — Directors (minimax/MiniMax-M2.7 or higher)
  product-director     creative-director     technical-director     producer

Tier 2 — Department Leads (minimax/MiniMax-M2.7)
  product-manager      ux-lead               engineering-lead       qa-lead

Tier 3 — Specialists
  market-analyst      ux-designer           frontend-dev           backend-dev
  mobile-dev          data-engineer         security-engineer     qa-tester
  game-designer       gameplay-programmer   engine-programmer      ui-programmer
```

---

## Skills — Type `/` to access

**Onboarding:** `/start`

**Product (Apps):** `/brainstorm` `/spec` `/user-research` `/design-system` `/map-systems` `/estimate`

**Game Dev:** `/brainstorm` `/balance-check`

**Architecture & Code:** `/create-architecture` `/architecture-decision` `/code-review` `/tech-debt`

**Reviews:** `/design-review` `/gate-check`

**Production:** `/sprint-plan` `/milestone-review` `/scope-check`

**QA & Testing:** `/qa-plan` `/test-setup` `/test-helpers` `/smoke-check`

---

## Getting Started

1. **New project:** `/start` — guided onboarding, detects project stage
2. **Existing project:** `/onboard` — adopts project, reads existing structure
3. **Resume:** Session state auto-recovered on session start

---

## Architecture Principles

- **Human in control:** Every major decision goes to user — agents present options, human chooses
- **Separation of concerns:** Directors own vision, Leads own execution, Specialists do hands-on work
- **Quality gates:** Before phase transitions, directors review and approve
- **No silent execution:** Agents ask before writing files, show drafts before requesting approval

---

## Collaboration Protocol

**Question → Options → Decision → Draft → Approval**

1. Agent asks clarification questions
2. Agent presents 2-4 options with reasoning
3. User decides (or asks for more options)
4. Agent drafts the deliverable
5. User approves before files are written

---

## Model Tier Strategy

| Tier | Model | Use |
|------|-------|-----|
| **Director** | `minimax/MiniMax-M2.7` | High-stakes decisions, gate verdicts, multi-doc synthesis |
| **Lead** | `minimax/MiniMax-M2.7` | Implementation planning, code review, design authoring |
| **Specialist** | `minimax/MiniMax-M2.7` | Execution, implementation, writing |

---

> **Note:** This studio template is engine-agnostic. It works for web apps, mobile apps,
> SaaS, and games. Use the skills relevant to your project type.