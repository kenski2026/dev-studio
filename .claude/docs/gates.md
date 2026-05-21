# Director Gates — Review Checkpoints

Phase gates where directors review and approve work before the project advances.

---

## Review Modes

| Mode | What runs | Best for |
|------|-----------|----------|
| `full` | All gates active — every step reviewed | Teams, thorough review |
| `lean` | PHASE-GATE only — milestone reviews | Solo developers, default |
| `solo` | No gates — maximum speed | Game jams, rapid prototypes |

Set via `docs/production/review-mode.txt` (full/lean/solo).

---

## Phase Gate: CD-PHASE-GATE / TD-PHASE-GATE / PR-PHASE-GATE / PD-PHASE-GATE

**Trigger**: At phase transitions via `/gate-check`

**Verdicts**: READY / CONCERNS / NOT READY

| Director | Gate | Domain |
|----------|------|--------|
| Creative Director | CD-PHASE-GATE | Design vision, UX coherence, design principles |
| Technical Director | TD-PHASE-GATE | Architecture soundness, technical feasibility |
| Producer | PR-PHASE-GATE | Scope realistic, timeline achievable, risks known |
| Product Director | PD-PHASE-GATE | Business objectives met, market positioning correct |

**Escalation**: Any NOT READY → overall NOT READY

---

## Feature Gate: SPEC-REVIEW

**Trigger**: After SPEC.md is drafted, before development begins

**Verdicts**: APPROVED / CONCERNS / REJECTED

Check:
- All user stories have clear acceptance criteria
- Tech stack is appropriate for the problem
- Scope is achievable for the timeline
- Open questions are tracked

---

## Architecture Gate: ADR-REVIEW

**Trigger**: After each Architecture Decision Record is drafted

**Verdicts**: APPROVED / CONCERNS / REJECTED

Check:
- Clear problem statement and rationale
- Rejected alternatives genuinely considered
- Consequences section is honest about trade-offs
- Links to relevant product requirements

---

## Sprint Gate: SPRINT-REVIEW

**Trigger**: Before a sprint plan is finalized

**Verdicts**: APPROVED / CONCERNS / REJECTED

Check:
- Story load is realistic for capacity
- Dependencies are correctly ordered
- No hidden dependencies that could block mid-sprint
- Buffer exists for unexpected work