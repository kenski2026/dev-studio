---
name: test-setup
description: "Set up the testing infrastructure for a project. Configure test frameworks, write initial test templates, and establish testing conventions."
argument-hint: "[frontend|backend|both]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Bash
model: minimax/MiniMax-M2.7
---

# /test-setup — Testing Infrastructure Setup

Set up the testing infrastructure for the project.

## Phase 1: Identify Project Type

Ask or detect:
- Frontend only / Backend only / Full-stack
- Primary language and framework
- Existing test infrastructure (if any)

## Phase 2: Frontend Testing (if applicable)

For **React/Next.js**:
```bash
npm install --save-dev @testing-library/react @testing-library/jest-dom jest @types/jest
```

For **Vue/Nuxt**:
```bash
npm install --save-dev @vue/test-utils vitest
```

For **Flutter**:
```bash
flutter test
```

**Test structure**:
```
tests/
  unit/
    components/
    hooks/
    utils/
  integration/
  e2e/
```

## Phase 3: Backend Testing

For **Node.js**:
```bash
npm install --save-dev jest @types/jest ts-jest
```

For **Python/FastAPI**:
```bash
pip install pytest pytest-asyncio
```

For **Go**:
```bash
go get github.com/stretchr/testify
```

## Phase 4: E2E Testing

For **Web apps**:
```bash
npm install --save-dev playwright @playwright/test
npx playwright install
```

For **API testing**:
```bash
npm install --save-dev supertest
```

## Phase 5: CI Configuration

Create `.github/workflows/test.yml`:
```yaml
name: Tests
on: [push, pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run tests
        run: npm test
      - name: Run e2e
        run: npm run test:e2e
```

## Phase 6: Testing Conventions

Document in `docs/qa/test-standards.md`:

```markdown
## Test File Naming
- Unit tests: `[name].test.ts`
- Integration tests: `[name].integration.test.ts`
- E2E tests: `[feature].e2e.ts`

## Test Structure (AAA pattern)
1. **Arrange**: Set up test data
2. **Act**: Execute the behavior
3. **Assert**: Verify the outcome

## Coverage Targets
- Unit tests: 80%+ coverage on business logic
- Integration tests: All API endpoints
- E2E tests: Critical user paths only
```

## Phase 7: Write Initial Tests

Create smoke tests for the core functionality to verify the setup works.

## Phase 8: Confirm

```
Present the test setup. Ask:
"May I write the test infrastructure to the project?"

Options:
  [A] Yes — set it up
  [B] Adjust configuration
  [C] Skip for now
```