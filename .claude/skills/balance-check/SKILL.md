---
name: balance-check
description: "Review game balance — analyze combat, economy, progression, and progression systems for balance issues. Use after major game changes or before playtesting."
argument-hint: "[system or 'all']"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write
model: minimax/MiniMax-M2.7
---

# /balance-check — Game Balance Analysis

Analyze game systems for balance issues.

## Phase 1: Identify Systems to Check

- If `all`: check all game systems
- If specific system: check that system (combat, economy, progression, etc.)
- Read the relevant design docs: `docs/game/gdd/[system]-system.md`

## Phase 2: Quantitative Analysis

For numeric systems, analyze:

**Combat balance:**
```markdown
## Combat Balance

| Unit/Ability | Cost | Damage | Health | Efficiency (DPS/Cost) | Verdict |
|--------------|------|--------|--------|----------------------|---------|
| [Unit A] | [cost] | [dmg] | [hp] | [ratio] | Balanced / Overpowered / Underpowered |
```

**Progression balance:**
- Are rewards proportional to challenge?
- Does difficulty curve feel fair?
- Are there dead zones (levels where nothing useful is earned)?

**Economy balance:**
- Is currency earning vs. spending balanced?
- Are there exploitative loops (infinite gold, etc.)?
- Is there meaningful choice in how to spend resources?

## Phase 3: Qualitative Analysis

Check for common balance issues:
- **Dominant strategy**: One approach wins every time
- **Rock-paper-scissors broken**: One option beats all others
- **Negative sum**: The game gets harder the longer you play
- **Positive sum**: No meaningful choice (always do X)

## Phase 4: Player Experience Check

```markdown
## Player Experience

| Scenario | Expected Feel | Risk |
|----------|---------------|------|
| New player, early game | [Feel] | [Risk: frustration/powergap] |
| Mid-game, average skill | [Feel] | [Risk: boredom/powergap] |
| Late-game, skilled player | [Feel] | [Risk: domination/powergap] |
```

## Phase 5: Recommendations

```markdown
## Balance Adjustments Needed

### Nerf (reduce power)
- [Item/ability]: Reduce [X] → [Y] because [reason]

### Buff (increase power)
- [Item/ability]: Increase [X] → [Y] because [reason]

### Redesign
- [System]: Current state creates [problem] — suggest [alternative]
```

## Phase 6: Report

```
Present the balance analysis. Ask:
"May I write this to docs/game/balance-reviews/review-[YYYY-MM-DD].md?"

Options:
  [A] Yes — write it
  [B] Adjust recommendations
  [C] Skip for now
```