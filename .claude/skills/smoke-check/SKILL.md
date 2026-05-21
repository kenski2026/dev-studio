---
name: smoke-check
description: "Quick smoke test — verify that the core functionality works end-to-end. Use before releases or after significant changes."
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Bash
model: minimax/MiniMax-M2.7
---

# /smoke-check — Quick Smoke Test

Run a quick smoke test to verify core functionality works.

## Phase 1: Identify Core Paths

From the SPEC.md or design docs, identify the top 3-5 critical user paths:

1. **Happy path**: [What users do most often]
2. **Auth path**: [Login/authentication — if applicable]
3. **Core feature**: [The main value-delivering feature]
4. **Data integrity**: [Critical data operations]
5. **Error handling**: [What happens when things go wrong]

## Phase 2: Execute Tests

Run smoke tests:

```bash
# If automated tests exist:
npm run test:smoke
# or
pytest tests/smoke/

# If manual, document what to check:
```

For each path, verify:
- The feature works as documented
- No console errors (frontend)
- No exceptions or errors in logs
- Response times are acceptable

## Phase 3: Report

```markdown
## Smoke Test Results — [YYYY-MM-DD]

| Test | Status | Duration | Notes |
|------|--------|----------|-------|
| [Path 1] | PASS/FAIL | [ms] | [Notes] |
| [Path 2] | PASS/FAIL | [ms] | [Notes] |

**Overall**: [X/Y passed]

### Failures (if any)
- [Test name]: [What failed] → [Expected vs actual]
```

## Phase 4: Decision

- All pass → Safe to release
- 1-2 failures → Fix before release or accept risk with known issues
- 3+ failures → Do not release, investigate immediately