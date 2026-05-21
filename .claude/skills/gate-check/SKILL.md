---
name: gate-check
description: "Run phase gate review — spawn all relevant directors for a coordinated readiness check before phase transitions. This is the master quality gate for the project."
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, WebSearch
model: minimax/MiniMax-M2.7
---

# /gate-check — Phase Gate Review

Run a coordinated director review before phase transitions.

## Phase 1: Identify Target Phase

Ask the user:
```
What phase are you transitioning to?
  [A] Concept — From idea to structured plan
  [B] Spec — From brief to detailed specification
  [C] Architecture — From spec to technical design
  [D] Development — From design to implementation
  [E] Release — From implementation to shipping
```

## Phase 2: Collect Artifacts

Based on the target phase, collect relevant files:

**Concept phase artifacts:**
- `SPEC.md` or `docs/product/product-brief.md`
- `docs/design/principles.md` (if exists)
- Any existing notes or drafts

**Spec phase artifacts:**
- `SPEC.md`
- `docs/product/user-stories.md`
- `docs/design/ux-specs.md`

**Architecture phase artifacts:**
- `docs/architecture/overview.md`
- `docs/architecture/adr-index.md`
- Technical requirements

**Development phase artifacts:**
- Sprint plans
- Code structure (`src/`)
- Test coverage

**Release phase artifacts:**
- Changelog
- Test results
- Deployment checklist

## Phase 3: Spawn Directors in Parallel

Spawn all relevant directors simultaneously using `sessions_spawn`:

```
Spawn all agents via sessions_spawn (issue all calls before waiting):

1. creative-director → Gate: CD-PHASE-GATE
   Context: Target phase name, list of artifacts present, design principles

2. technical-director → Gate: TD-PHASE-GATE
   Context: Target phase name, architecture documents, ADR list

3. producer → Gate: PR-PHASE-GATE
   Context: Target phase name, sprint/milestone status, team capacity

4. product-director → Gate: PD-PHASE-GATE
   Context: Target phase name, roadmap, business objectives

Issue all 4 spawn calls simultaneously. Wait for all 4 verdicts.
```

## Phase 4: Apply Escalation Rules

Collect all verdicts and apply escalation:

- **Any NOT READY** → Overall verdict is NOT READY
  - Surface blockers to the user immediately
  - Do not proceed with the phase transition until resolved

- **Any CONCERNS (and none NOT READY)** → Overall verdict is CONCERNS
  - Surface concerns to the user
  - Options: `Revise flagged items` / `Accept and proceed` / `Discuss further`

- **All READY** → Overall verdict is READY
  - Proceed with the phase transition
  - Document the gate outcome in `docs/production/gates.md`

## Phase 5: Report

Present a summary to the user:

```markdown
## Phase Gate Review — [Phase Name]

**Overall Verdict:** READY / CONCERNS / NOT READY

### Director Verdicts:
| Director | Verdict | Notes |
|----------|---------|-------|
| Creative Director | [READY/CONCERNS/NOT READY] | [Notes] |
| Technical Director | [READY/CONCERNS/NOT READY] | [Notes] |
| Producer | [READY/CONCERNS/NOT READY] | [Notes] |
| Product Director | [READY/CONCERNS/NOT READY] | [Notes] |

### Next Steps:
[If READY:] You're clear to proceed to [Phase Name].
[If CONCERNS:] Review the flagged items before proceeding.
[If NOT READY:] Resolve these blockers before transitioning.
```

## Phase 6: Document

After the review, append the outcome to `docs/production/gates.md`:

```markdown
## Gate: [Phase] — [YYYY-MM-DD]

**Overall**: [READY/CONCERNS/NOT READY]

| Director | Verdict |
|----------|---------|
| Creative Director | [verdict] |
| Technical Director | [verdict] |
| Producer | [verdict] |
| Product Director | [verdict] |

**Blockers** (if any): [list]
**Action items**: [list]
```