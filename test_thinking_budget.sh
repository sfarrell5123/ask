#!/bin/bash
# Test thinking_budget parameter with compact/summary functions

set -e

echo "=== Testing thinking_budget=-1 (auto) for Gemini Flash Lite ==="
echo ""

# Clear history
echo "1. Clearing history..."
./ask --clear

# Create some conversation history
echo "2. Creating test conversation..."
./ask "what is 2+2?" > /dev/null
./ask "what is 3+3?" > /dev/null
./ask "list files" > /dev/null

# Check history size
HISTORY_SIZE=$(wc -c < ~/.cache/ask/history.json)
echo "   History file size: $HISTORY_SIZE bytes"

# Test --summary (read-only, uses thinking_budget=-1)
echo ""
echo "3. Testing --summary (should use thinking_budget=-1)..."
./ask --summary

# Test --compact (modifies history, uses thinking_budget=-1)
echo ""
echo "4. Testing --compact (should use thinking_budget=-1)..."
./ask --compact

# Check compacted size
COMPACT_SIZE=$(wc -c < ~/.cache/ask/history.json)
echo ""
echo "   Compacted history size: $COMPACT_SIZE bytes"
echo "   Reduction: $((HISTORY_SIZE - COMPACT_SIZE)) bytes"

echo ""
echo "=== Test complete ==="
