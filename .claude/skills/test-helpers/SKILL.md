---
name: test-helpers
description: "Generate helper utilities and fixtures for testing. Use after /test-setup to create reusable test components, mock data factories, and test utilities for the project."
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Bash
model: minimax/MiniMax-M2.7
---

# /test-helpers — Test Utilities Generator

Generate helper utilities and fixtures for testing.

## Phase 1: Detect Project Type

Check the project for:
- Framework (React/Vue/Flutter/Next.js/etc.)
- Language (TypeScript/Python/Go/etc.)
- Existing test infrastructure

## Phase 2: Generate Helpers

Based on the project type, generate appropriate helpers:

### For TypeScript/React projects:

**Mock data factory** (`tests/fixtures/mocks.ts`):
```typescript
export const createMockUser = (overrides = {}) => ({
  id: 'user-1',
  email: 'test@example.com',
  name: 'Test User',
  createdAt: new Date(),
  ...overrides
});

export const createMockProduct = (overrides = {}) => ({
  id: 'prod-1',
  name: 'Test Product',
  price: 99.99,
  ...overrides
});
```

**API mock** (`tests/fixtures/api.ts`):
```typescript
import { rest } from 'msw';

export const handlers = [
  rest.get('/api/users', (req, res, ctx) => {
    return res(ctx.json([createMockUser()]));
  }),
];
```

### For Python/FastAPI projects:

**Fixtures** (`tests/fixtures.py`):
```python
import pytest
from app.models import User

@pytest.fixture
def mock_user():
    return User(id="1", email="test@example.com", name="Test")

@pytest.fixture
def client():
    from app.main import app
    from fastapi.testclient import TestClient
    return TestClient(app)
```

### For Go projects:

**Test helpers** (`tests/helpers.go`):
```go
func TestDB(t *testing.T) *sql.DB {
    db, _ := sql.Open("sqlite", ":memory:")
    return db
}
```

## Phase 3: Create Test Macros/Utilities

Common utilities:
- `waitFor(condition, timeout)` — polling helper
- `assertEventually(condition, interval, timeout)` — async assertions
- `spyOn(obj, method)` — call tracking
- `mockTimer(time)` — time manipulation

## Phase 4: Write and Confirm

```
Present the test helpers. Ask:
"May I write these to tests/fixtures/?"

Options:
  [A] Yes — write them
  [B] Adjust to match existing patterns
  [C] Skip for now
```