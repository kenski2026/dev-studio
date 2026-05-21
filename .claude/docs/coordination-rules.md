# Coordination Rules

## Agent Hierarchy

```
Tier 1 — Directors (minimax/MiniMax-M2.7)
  creative-director     technical-director     producer     product-director

Tier 2 — Department Leads (minimax/MiniMax-M2.7)
  product-manager      ux-lead               engineering-lead      qa-lead
  art-director        narrative-director     release-manager

Tier 3 — Specialists
  All execute under direction from Tier 1 or Tier 2
```

## Coordination Principles

1. **Vertical Delegation**: Directors delegate to leads, who delegate to specialists. Never skip a tier.
2. **Horizontal Consultation**: Agents at the same tier may consult but must not make binding cross-domain decisions.
3. **Conflict Resolution**: Design conflicts → creative-director. Technical conflicts → technical-director. Product conflicts → product-director.
4. **Change Propagation**: When a decision affects multiple domains, the producer coordinates.
5. **No Cross-Domain Writes**: An agent must never modify files outside their designated domain without explicit delegation.

## Subagent Spawning Pattern

Use `sessions_spawn` for subagents:

```
sessions_spawn(
  task: "[agent-task-description]",
  runtime: "subagent",
  agentId: "[agent-name]",
  context: "isolated",
  maxItems: 20,
  attachments: [context-files-if-needed]
)
```

For parallel spawning: issue all `sessions_spawn` calls before waiting for any result.

## Session State

After each significant decision or phase completion, update:
```
production/session-state/active.md
```

Include:
- Current task and phase
- Completed decisions and their rationale
- Next steps and pending decisions
- Open questions requiring user input

This enables session recovery if context is compacted.