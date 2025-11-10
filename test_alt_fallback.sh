#!/bin/bash
# Test --alt fallback chain: polaris-alpha -> kimi-k2-thinking -> gpt-5-mini

echo "=== Testing --alt fallback chain ==="
echo ""
echo "Fallback order:"
echo "  1. openrouter/polaris-alpha"
echo "  2. moonshotai/kimi-k2-thinking"
echo "  3. openai/gpt-5-mini"
echo ""

./ask --clear > /dev/null 2>&1

echo "Testing with simple question using --alt flag..."
echo ""

./ask --alt "what is 2+2?"

echo ""
echo "=== Test complete ==="
echo "Check above to see which model succeeded"
