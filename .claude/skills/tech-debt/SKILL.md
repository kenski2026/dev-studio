---
name: tech-debt
description: "Identify, document, and plan technical debt remediation. Use when tech debt is blocking progress, before releases, or during retrospectives."
user-invocable: true
allowed-tools: Read, Glob, Grep, Write
model: minimax/MiniMax-M2.7
---

# /tech-debt — Technical Debt Tracker

Identify, document, and plan tech debt remediation.

## Phase 1: Scan for Tech Debt

Search the codebase for indicators:
```bash
# Hardcoded values
grep -rn "magic" src/ || grep -rn "[0-9]\{5,\}" src/ --include="*.py" --include="*.ts"

# TODO/FIXME without owner
grep -rn "TODO\|FIXME\|HACK" src/

# Duplicated code
grep -rn "copy-paste\|duplicated" src/ || use a duplication tool

# Deprecated API usage
grep -rn "deprecated\|will be removed" src/
```

## Phase 2: Document Each Item

For each debt item found:

```markdown
## [TD-001]: [Short title]

**Location**: [File:line or 'Multiple files']
**Type**: [Hardcoded value / Duplicated code / Deprecated API / Design flaw]
**Severity**: High / Medium / Low
**Interest cost**: [Hours lost per week/month due to this debt]

**Problem**: [What's wrong]
**Why it exists**: [What pressure created this debt]

**Remediation options**:
- **Quick fix**: [Fast but temporary — X hours]
- **Proper fix**: [Right way — X hours]
- **Accept**: [Live with it — ongoing cost]
```

## Phase 3: Prioritize

| Debt | Severity | Interest Cost | Remediation Cost | Priority |
|------|----------|---------------|------------------|----------|
| TD-001 | High | 2hr/week | 4hr | 1 |
| TD-002 | Med | 1hr/week | 8hr | 2 |

**Priority formula**: Severity × Interest Cost / Remediation Cost

## Phase 4: Plan

```markdown
## Tech Debt Remediation Plan

### This Sprint
- [TD-001] — Quick fix, [X] hours

### Next Sprint
- [TD-002] — Proper fix, [X] hours
- [TD-003] — Quick fix, [X] hours

### Backlog
- [TD-004] — [X] hours when capacity allows
```

## Phase 5: Write and Confirm

```
Present the tech debt report. Ask:
"May I write this to docs/architecture/tech-debt.md?"

Options:
  [A] Yes — write it
  [B] Adjust priorities
  [C] Accept some debt and move on
```