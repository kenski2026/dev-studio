#!/bin/bash
# Hook: detect-gaps.sh
# Event: SessionStart
# Purpose: Detect missing documentation when code or prototypes exist
# POSIX-compatible: uses grep -E, not grep -P

# Exit on error for debugging (don't fail the session)
set +e

echo "=== Checking for Documentation Gaps ==="

# --- Fresh project detection ---
FRESH_PROJECT=true
if [ -f "SPEC.md" ] || [ -f "docs/product/product-brief.md" ]; then
    FRESH_PROJECT=false
fi
if [ -d "src" ]; then
    SRC_CHECK=$(find src -type f \( -name "*.py" -o -name "*.js" -o -name "*.ts" -o -name "*.tsx" -o -name "*.go" -o -name "*.rs" -o -name "*.cpp" -o -name "*.h" \) 2>/dev/null | head -1)
    if [ -n "$SRC_CHECK" ]; then
        FRESH_PROJECT=false
    fi
fi

if [ "$FRESH_PROJECT" = true ]; then
    echo ""
    echo "New project detected. Run /start to begin guided setup."
    echo "==================================="
    exit 0
fi

# --- Check 1: Substantial code but no spec ---
SRC_FILES=0
if [ -d "src" ]; then
    SRC_FILES=$(find src -type f \( -name "*.py" -o -name "*.js" -o -name "*.ts" -o -name "*.tsx" -o -name "*.go" -o -name "*.rs" -o -name "*.cpp" -o -name "*.h" \) 2>/dev/null | wc -l)
    SRC_FILES=$(echo "$SRC_FILES" | tr -d ' ')
fi

HAS_SPEC=false
if [ -f "SPEC.md" ] || [ -f "docs/product/product-brief.md" ]; then
    HAS_SPEC=true
fi

if [ "$SRC_FILES" -gt 20 ] && [ "$HAS_SPEC" = false ]; then
    echo "⚠️  GAP: $SRC_FILES source files but no SPEC.md or product brief found"
    echo "    Run /spec to create the product specification"
fi

# --- Check 2: Code but no architecture docs ---
if [ -d "src" ] && [ ! -d "docs/architecture" ]; then
    if [ "$SRC_FILES" -gt 10 ]; then
        echo "⚠️  GAP: Code exists but no docs/architecture/ directory"
        echo "    Run /architecture-decision to document technical decisions"
    fi
fi

# --- Check 3: No design system with UI code ---
if [ -d "src/components" ] || [ -d "src/ui" ] || [ -d "src/pages" ]; then
    if [ ! -f "docs/design/design-system.md" ]; then
        echo "⚠️  GAP: UI code exists but no design system documented"
        echo "    Run /design-system to establish design guardrails"
    fi
fi

# --- Check 4: Many open tasks but no sprint plan ---
if [ -f "docs/product/backlog.md" ]; then
    OPEN_TODOS=$(grep -c "^\[ \]" docs/product/backlog.md 2>/dev/null || echo "0")
    if [ "$OPEN_TODOS" -gt 5 ] && [ ! -d "docs/product/sprints" ]; then
        echo "⚠️  GAP: $OPEN_TODOS open items but no sprint plans"
        echo "    Run /sprint-plan to plan the next sprint"
    fi
fi

echo "==================================="
exit 0