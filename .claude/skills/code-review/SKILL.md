---
name: code-review
description: "Code review — analyze implementation against design, architecture, and coding standards. Review code quality, correctness, testability, and adherence to project standards."
argument-hint: "[files or 'all']"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Bash
model: minimax/MiniMax-M2.7
---

# /code-review — Code Quality Review

Review implementation against design, architecture, and coding standards.

## Phase 1: Identify Scope

- If `all`: review all code in `src/`
- If specific files: review those files
- Check for related files (tests, configs)

## Phase 2: Architecture Review

Check that the code matches the architecture:
- Are system boundaries respected?
- Are API contracts followed?
- Is there unexpected cross-domain coupling?

```markdown
## Architecture Compliance

| Check | Status | Notes |
|-------|--------|-------|
| [Check 1] | Pass/Fail | [Notes] |
```

## Phase 3: Code Quality Review

Check against coding standards:

- **Naming**: Clear, consistent, intention-revealing
- **Functions**: Single responsibility, reasonable length
- **Complexity**: Cyclomatic complexity within limits
- **Error handling**: Graceful failures, logged appropriately
- **Security**: Input validation, parameterized queries, auth checks

```markdown
## Code Quality

| File | Issues | Severity |
|------|--------|----------|
| [file] | [issue] | High/Med/Low |
```

## Phase 4: Test Coverage Review

- Are tests present and passing?
- Are edge cases covered?
- Do tests assert behavior, not implementation?

## Phase 5: Findings Summary

```markdown
## Review Summary

### Must Fix
- [Blocking issue 1]
- [Blocking issue 2]

### Should Fix
- [Important issue 1]

### Consider
- [Improvement suggestion 1]

### Good
- [What's working well]
```

## Phase 6: Report

Present findings to the user with actionable items.

If there are blocking issues:
```
"May I write a review report to docs/production/code-reviews/review-[YYYY-MM-DD].md?"

Options:
  [A] Yes — write and create fix tasks
  [B] Discuss the findings first
```

After approval, write the report with specific fix tasks.