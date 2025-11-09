# Tool Calling Improvements

## Changes Made

### 1. Improved Tool Descriptions
- Enhanced descriptions to be more specific about when/why to use each tool
- Added usage examples and guidance
- Clarified line number requirements (1-based indexing)
- Added warnings about avoiding interactive commands

### 2. Cleaned Up System Prompt
- Removed outdated `<think>` XML tag references
- Removed JSON format examples that were confusing models
- Removed redundant "Available Functions" section (tools self-describe)
- Kept Task Execution Flow and best practices
- Made prompt more generic (not provider-specific)

### 3. Added XML Tool Call Parser
- Parses `<function_calls>` / `<invoke>` / `<parameter>` format
- Handles Kimi and Claude-style XML tool calling
- Example:
  ```xml
  <function_calls>
    <invoke name="execute_command">
      <parameter name="reasoning">Check mount</parameter>
      <parameter name="command">ls -la</parameter>
    </invoke>
  </function_calls>
  ```

### 4. Enhanced JSON Parser
- Now handles raw JSON without code blocks
- Extracts JSON objects from plain text responses
- Example: `{"tool": "execute_command", "command": "ls"}`

### 5. Added Light Lavender Reasoning Color
- Changed reasoning text color to light lavender (`\033[38;5;153m`)
- Distinct from cyan output and green tool names
- Easy to read on black console

### 6. Added Retry Logic for Transient Errors
- Automatically retries up to 3 times on transient errors
- Exponential backoff: 3s, 6s, 9s delays
- Orange colored warnings (`\033[38;5;208m`) for retry messages
- Handles: 400/500/502/503 errors, timeouts, connection issues
- Example error message:
  ```
  ⚠ Transient error: Error code: 400 - unknown error in the model inference...
  ⏳ Waiting 3 seconds before retry 2/3...
  ```

### 7. Added History Size Warning
- Checks history file size on every run
- Yellow/gold warning (`\033[38;5;220m`) when history > 10KB
- Suggests running `ask --compact` to reduce size
- Example warning:
  ```
  ⚠ History file is 15,234 bytes (>10,000 bytes)
  💡 Consider running: ask --compact
  ```

## Supported Formats

The tool now handles 5 different tool calling formats:

1. **Native OpenRouter tool calling** (preferred)
2. **XML format**: `<function_calls><invoke name="X">...</invoke></function_calls>`
3. **Raw JSON**: `{"tool": "execute_command", ...}`
4. **JSON code blocks**: ` ```json {...} ``` `
5. **Python code blocks**: ` ```python execute_command(...) ``` `

## Testing

Parsers tested and verified:
- ✓ XML parser with execute_command
- ✓ Raw JSON parser  
- ✓ Existing code block parsers still work

## Files Modified

- `/Users/notes/dev/ask/ask` - Main script
- `/Users/notes/dev/ask/color_test.py` - Color testing utility
