#!/bin/bash
# Test call_llm_simple() with phi-4 model via --summary

set -e

echo "=== Testing call_llm_simple() with phi-4 ==="
echo ""

# Clear history
echo "1. Clearing history..."
./ask --clear

# Create test conversation
echo "2. Creating test conversation..."
./ask "what is 2+2?" > /dev/null 2>&1
./ask "what is 3+3?" > /dev/null 2>&1
./ask "list files" > /dev/null 2>&1

echo "   Created 3 conversations"

# Test --summary with phi-4 (should NOT error on "not a tool calling model")
echo ""
echo "3. Testing --summary with phi-4-reasoning-plus..."
echo "   (Previously failed with 'not a tool calling model' error)"
echo ""

./ask --summary

echo ""
echo "=== Test complete - phi-4 should work now! ==="
