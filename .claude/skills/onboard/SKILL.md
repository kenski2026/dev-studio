---
name: onboard
description: "Adopt an existing project into DevStudio. Reads existing files, detects project type and stage, and sets up the .claude directory without overwriting existing work."
argument-hint: "[app|game|api or leave empty to auto-detect]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Bash
model: minimax/MiniMax-M2.7
---

# /onboard — Adopt Existing Project

Adopt an existing project into the DevStudio workflow.

## Phase 1: Detect Project Type

Check existing files to determine project type:

```bash
# Check for app markers
ls *.json package.json requirements.txt pyproject.toml Cargo.toml 2>/dev/null

# Check for game markers
ls Godot project.godot 2>/dev/null
ls *.unity 2>/dev/null
ls Content/ Config/ 2>/dev/null  # Unreal

# Check for framework
ls src/ app/ lib/ 2>/dev/null
ls pages/ components/ 2>/dev/null
```

**Ask if not clear:**
```
What type of project is this?
  [A] App / SaaS — Web or mobile application
  [B] Game — Interactive entertainment
  [C] API / Backend — Server-side service
  [D] Already detected — proceed
```

## Phase 2: Read Existing Structure

1. Map the existing directory structure
2. Read existing SPEC.md or README.md if present
3. Check for existing tests
4. Check for CI/CD configuration
5. Read any existing design docs or architecture docs

```bash
find . -maxdepth 3 -type f -name "*.md" -o -name "*.json" -o -name "*.yaml" 2>/dev/null | head -30
```

## Phase 3: Create .claude Directory

Copy the DevStudio template structure:
```bash
cp -r ~/.openclaw/workspace/dev-studio/.claude .
```

Then customize:
- Update `CLAUDE.md` with project-specific technology choices
- Read existing SPEC.md into the project context
- Preserve existing `src/`, `tests/`, and `docs/` directories

## Phase 4: Detect Project Stage

After reading existing files:

| Indicator | Stage |
|-----------|-------|
| No src/, empty project | Concept |
| Has src/ with basic structure | Spec |
| Has docs/architecture/ | Architecture |
| Has tests/ and CI/CD | Development |
| Has CHANGELOG.md, tags | Released |

## Phase 5: Set Up Initial Context

Create `docs/product/project-context.md`:
```markdown
# Project Context — [Project Name]

**Adopted**: [YYYY-MM-DD]
**Project type**: [App/Game/API]
**Stage**: [Stage detected]
**Stack**: [Key technologies]

## Existing Artifacts
- [File]: [What it contains]
- ...

## Next Steps
- Run `/gate-check` to establish current stage
- Run `/spec` if starting fresh on features
- Run `/code-review` to assess existing code quality
```

## Phase 6: Confirm

```
"Onboarding complete. The DevStudio .claude directory has been added to your project.

Project summary:
- Type: [App/Game/API]
- Stage: [Stage]
- Files found: [N] source, [N] docs

Next steps:
1. Run /gate-check to establish where you are
2. Run /sprint-plan to plan the next sprint
3. Run /code-review to assess existing code quality

May I proceed with this setup?"
```