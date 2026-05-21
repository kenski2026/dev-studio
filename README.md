# DevStudio — AI Development Studio Template

Turn a single OpenClaw session into a **full application and game development studio** with coordinated AI agents.

**18 skills. 14 agents. Coordinated AI team.**

Built for OpenClaw with MiniMax MCP — uses `sessions_spawn` for subagent orchestration.

---

## What You Get

| Category | Count | Description |
|----------|-------|-------------|
| **Agents** | 14 | 4 Directors → 4 Leads → 6 Specialists |
| **Skills** | 18 | Slash commands covering full dev lifecycle |
| **Hooks** | 3 | Automated validation and gap detection |
| **Rules** | 9 | Path-scoped coding standards |
| **Gates** | 8 | Director review checkpoints |

---

## Studio Hierarchy

```
Tier 1 — Directors
  product-director    creative-director    technical-director    producer

Tier 2 — Leads
  product-manager     frontend-dev        backend-dev           qa-lead

Tier 3 — Specialists
  game-designer      art-director        narrative-director
  performance-analyst security-engineer  qa-tester
```

---

## Quick Start

### New Project
```bash
# Copy the template
cp -r ~/.openclaw/workspace/dev-studio my-project
cd my-project

# Open OpenClaw and run:
/start
```

### Adopt Existing Project
```bash
cd my-existing-project
cp -r ~/.openclaw/workspace/dev-studio/.claude .
/onboard
```

---

## Skills — Type `/` to access

| Category | Skills |
|----------|--------|
| **Onboarding** | `/start` |
| **Product** | `/spec` `/brainstorm` `/design-system` `/estimate` |
| **Game Dev** | `/balance-check` |
| **Architecture** | `/architecture-decision` `/code-review` `/tech-debt` |
| **Production** | `/sprint-plan` `/scope-check` `/milestone-review` |
| **QA** | `/qa-plan` `/test-setup` `/test-helpers` `/smoke-check` |
| **Reviews** | `/design-review` |
| **Gates** | `/gate-check` |

---

## Key Concepts

### Collaboration Protocol
**Question → Options → Decision → Draft → Approval**

Agents present options with pros/cons, the human decides, the agent implements.

### Quality Gates
Before phase transitions, directors review the work:
```
/gate-check  →  Run coordinated director review
```

### Session Recovery
Session state is saved automatically. If context is compacted, the session
can resume from `production/session-state/active.md`.

---

## Architecture Principles

1. **Human in control** — Every major decision goes to the user
2. **Separation of concerns** — Directors own vision, leads own execution, specialists do the work
3. **Quality gates** — Directors review before phase transitions
4. **No silent execution** — Agents ask before writing, show drafts before requesting approval

---

## Extending the Studio

- **Add a skill**: Create `.claude/skills/[name]/SKILL.md`
- **Add an agent**: Create `.claude/agents/[type]/[name].md`
- **Add a rule**: Create `.claude/rules/[name].md`
- **Add a hook**: Add to `.claude/settings.json`

---

## Based On

Inspired by [Claude-Code-Game-Studios](https://github.com/Donchitos/Claude-Code-Game-Studios) by Donchitos.
Adapted for OpenClaw with MiniMax MCP.

**License**: MIT