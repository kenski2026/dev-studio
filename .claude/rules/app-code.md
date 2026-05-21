# Coding Standards

## General

- **Single responsibility**: One function, one purpose
- **Readable naming**: Functions do what their names say
- **No magic numbers**: Use named constants
- **Error handling**: Always handle errors gracefully

## Code Style

### TypeScript / JavaScript
- Use TypeScript for new projects
- Strict mode enabled
- No `any` — use proper types or `unknown`
- Co-locate tests with source files

### Python
- PEP 8 style guide
- Type hints on function signatures
- Docstrings on public functions

### Go
- Standard Go formatting (`go fmt`)
- Error wrapping with context
- Context propagation for cancellation

## Data Handling

- Validate all external input
- No secrets in code — use environment variables
- No hardcoded credentials or API keys
- Log sensitive operations (but not the data)

## Testing Standards

- Unit tests on all business logic
- Integration tests for API boundaries
- E2E tests for critical user paths
- Tests must be deterministic (no flaky tests)

## Performance

- Profile before optimizing
- No premature optimization
- Monitor: latency, throughput, error rate