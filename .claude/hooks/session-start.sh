#!/bin/bash
# Hook: session-start.sh
# Event: SessionStart
# Purpose: Load project context at session start, detect session recovery
# POSIX-compatible: uses grep -E, not grep -P

echo "=== DevStudio — Session Context ==="

# Check git status
BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
if [ -n "$BRANCH" ]; then
    echo "Branch: $BRANCH"
    echo ""
    echo "Recent commits:"
    git log --oneline -3 2>/dev/null | while read -r line; do
        echo "  $line"
    done
fi

# Check for active session state
STATE_FILE="production/session-state/active.md"
if [ -f "$STATE_FILE" ]; then
    echo ""
    echo "=== ACTIVE SESSION STATE DETECTED ==="
    echo "A previous session left state at: $STATE_FILE"
    echo "Quick summary (last 15 lines):"
    tail -15 "$STATE_FILE" 2>/dev/null
    TOTAL_LINES=$(wc -l < "$STATE_FILE" 2>/dev/null)
    if [ "$TOTAL_LINES" -gt 15 ]; then
        echo "  ... ($TOTAL_LINES total lines)"
    fi
    echo "=== END SESSION STATE PREVIEW ==="
fi

# Check for project type
if [ -f "SPEC.md" ]; then
    echo ""
    echo "Project: SPEC.md found (app/SaaS project)"
elif [ -f "docs/game/gdd/game-concept.md" ]; then
    echo ""
    echo "Project: Game project detected"
elif [ -d "src" ]; then
    SRC_COUNT=$(find src -type f \( -name "*.py" -o -name "*.js" -o -name "*.ts" -o -name "*.tsx" -o -name "*.go" -o -name "*.rs" \) 2>/dev/null | wc -l)
    if [ "$SRC_COUNT" -gt 0 ]; then
        echo ""
        echo "Project: $SRC_COUNT source files found"
    fi
fi

# Open todos from backlog
if [ -f "docs/product/backlog.md" ]; then
    OPEN_TODOS=$(grep -c "^\[ \]" docs/product/backlog.md 2>/dev/null || echo "0")
    if [ "$OPEN_TODOS" -gt 0 ]; then
        echo "Open backlog items: $OPEN_TODOS"
    fi
fi

echo "==================================="
exit 0