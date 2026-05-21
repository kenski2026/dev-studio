---
name: qa-plan
description: "Create a comprehensive test plan for a feature or release. Covers test strategy, coverage targets, test types, and acceptance criteria."
argument-hint: "[feature or 'release']"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write
model: minimax/MiniMax-M2.7
---

# /qa-plan — Test Planning

Create a comprehensive test plan for a feature or release.

## Phase 1: Understand the Scope

1. Read the feature spec or release notes
2. Identify what changed (new features, modified behavior, fixed bugs)
3. Identify the target users and environments

## Phase 2: Risk Assessment

For each change, assess:
- **What could break?** (functionality, performance, security)
- **How likely?** (High/Med/Low)
- **How severe?** (blocks release / annoying / minor)

```markdown
## Risk Matrix

| Change | What could break | Likelihood | Severity | Risk |
|--------|------------------|------------|----------|------|
| [Change 1] | [Risk] | High | High | Critical |
```

## Phase 3: Test Coverage

**Unit tests** (who writes: developer):
- All business logic functions
- Edge cases and error conditions
- Target: 80%+ coverage on changed code

**Integration tests** (who writes: developer + QA):
- API endpoints
- Database operations
- External service integration
- Target: All critical paths covered

**E2E tests** (who writes: QA):
- Critical user journeys
- Smoke tests for hot paths
- Target: 100% of P0 user stories

## Phase 4: Test Environments

```markdown
## Test Environments

| Environment | Purpose | Data | Access |
|-------------|---------|------|--------|
| Local | Development | Mock | Dev team |
| Dev | Integration | Sample | QA |
| Staging | Pre-release | Anonymized prod | QA + PM |
| Production | Monitoring | Real | DevOps |
```

## Phase 5: Test Schedule

```markdown
## Test Schedule

- [Date]: Unit tests complete
- [Date]: Integration tests complete
- [Date]: E2E tests complete
- [Date]: UAT with PM
- [Date]: Final smoke test
- [Date]: Release
```

## Phase 6: Write and Confirm

```
Present the test plan. Ask:
"May I write this to docs/qa/test-plan-[feature]-[YYYYMMDD].md?"

Options:
  [A] Yes — write it
  [B] Adjust coverage targets
  [C] Skip for this feature
```