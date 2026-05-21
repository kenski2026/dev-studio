#!/bin/bash
# Hook: validate-commit.sh
# Event: PreToolUse (Bash — git commit commands)
# Purpose: Validate design docs and code before commit
# POSIX-compatible: uses grep -E, not grep -P

COMMAND="$1"
if [ -z "$COMMAND" ]; then
    COMMAND=$(echo "$BASH_COMMAND" 2>/dev/null)
fi

# Only process git commit commands
if ! echo "$COMMAND" | grep -qE '^git[[:space:]]+commit'; then
    exit 0
fi

# Get staged files
STAGED=$(git diff --cached --name-only 2>/dev/null)
if [ -z "$STAGED" ]; then
    exit 0
fi

WARNINGS=""

# Check design documents for required sections
DESIGN_FILES=$(echo "$STAGED" | grep -E '^(docs/|SPEC\.md)')
if [ -n "$DESIGN_FILES" ]; then
    while IFS= read -r file; do
        if [[ "$file" == *.md ]] && [ -f "$file" ]; then
            # Basic check: file not empty
            if [ ! -s "$file" ]; then
                WARNINGS="$WARNINGS\nDESIGN: $file is empty"
            fi
        fi
    done <<< "$DESIGN_FILES"
fi

# Check for TODO without owner
SRC_FILES=$(echo "$STAGED" | grep -E '^(src/|lib/)')
if [ -n "$SRC_FILES" ]; then
    while IFS= read -r file; do
        if [ -f "$file" ]; then
            if grep -nE '(TODO|FIXME|HACK)[^(]' "$file" 2>/dev/null; then
                WARNINGS="$WARNINGS\nCODE: $file has TODO/FIXME without owner. Use TODO(name) format."
            fi
        fi
    done <<< "$SRC_FILES"
fi

# Print warnings (non-blocking) and allow commit
if [ -n "$WARNINGS" ]; then
    echo -e "=== Commit Validation Warnings ===$WARNINGS\n================================" >&2
fi

exit 0