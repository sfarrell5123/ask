# Ask - Your AI-Powered Terminal Companion

Stop context-switching. Stop googling command syntax. Just **ask**.

`ask` is a terminal-based AI assistant that can **do things** - not just answer questions. It executes commands, edits files, and handles everything from simple one-liners to complex multi-step operations. And for destructive tasks? It plans first, so you stay in control.

## Why This Tool?

### Simple Things, Instantly

```bash
ask "find all log files over 100MB"
ask "what's taking up space in this directory?"
ask "describe this file" mystery_data.bin
ask "create a backup script for /var/www and schedule it daily at 3am"
```

No flags to remember. No syntax to look up. Just describe what you want.

### Complex Things, Safely

```bash
ask "review ext4 performance settings, update mount options and kernel params, then verify your changes"
```

The assistant will:
1. **Plan** the operation (show you what it will do)
2. **Execute** each step (tune filesystem, update `/etc/fstab`, modify kernel params)
3. **Verify** its own work (check mount points, test settings)

For anything potentially destructive, it asks for confirmation first.

### Context That Persists

```bash
ask "check nginx error logs for issues"
# ... response ...

ask "now fix the most critical one and restart the service"
# Remembers the previous analysis and applies the fix
```

Conversation history means you can iterate naturally, building on previous commands.

## Real-World Examples

### System Administration & Operations
```bash
ask "show disk usage sorted by size"
ask "optimize nginx config for 10k concurrent connections"
ask "check if port 8080 is in use and kill the process"
ask "find all processes using more than 1GB RAM"
ask "set up log rotation for /var/log/app"
ask "tune kernel parameters for database performance"
```

### Security & Auditing
```bash
ask "scan this directory for files with suspicious permissions"
ask "check for open ports and identify the services"
ask "find all SUID binaries on the system"
ask "review SSH config for security issues"
ask "audit user accounts and identify inactive ones"
```

### File Operations & Search
```bash
ask "find all log files over 100MB"
ask "locate config files modified in the last 24 hours"
ask "find duplicate files in this directory tree"
ask "what format is this file?" unknown.dat
ask "recursively find files containing 'password'"
```

### Backup & Scheduling
```bash
ask "create a backup script for /var/www and schedule it daily at 2am"
ask "set up incremental backups for /home to external drive"
ask "create a cron job to clean old logs every Sunday"
ask "backup database and upload to S3 bucket"
```

### Image & Media Manipulation
```bash
ask "convert all PNGs in this folder to webp"
ask "crop profile.jpg to 400x400 square, centered on faces"
ask "reduce video.mp4 file size to under 50MB"
ask "batch resize all images to 1920px wide"
```

### Quick Code Analysis
```bash
ask "what does this script do?" mystery.sh
ask "find security vulnerabilities in this config" app.conf
ask "explain this function" utils.py
```

## Features

- **System Operations**: Execute commands, manage files, configure services - actual work, not just suggestions
- **Security Auditing**: Scan for vulnerabilities, check permissions, review configurations
- **Automated Workflows**: Create and schedule backup scripts, monitoring tasks, maintenance jobs
- **Planning Mode**: For complex or destructive operations, shows plan before execution
- **Context-Aware**: Include files as context, maintain conversation history
- **Self-Verification**: Can check its own work and iterate on tasks

## Installation

1. Clone or download the `ask` script:
   ```bash
   git clone https://github.com/sfarrell5123/ask.git
   cd ask
   ```

2. Make it executable:
   ```bash
   chmod +x ./ask
   ```

3. Install required Python packages:

   **Option A: Using pip directly:**
   ```bash
   pip3 install -r requirements.txt
   ```

   **Option B: Using Conda/Miniconda (recommended for isolated environments):**
   ```bash
   # Create a new conda environment
   conda create -n ask python=3.11 -y
   conda activate ask

   # Install dependencies
   pip install -r requirements.txt
   ```

   If using conda, add this alias to your shell config (`~/.zshrc` or `~/.bash_profile`):
   ```bash
   # Example for Miniconda on macOS
   alias ask='~/miniforge3/envs/ask/bin/python ~/dev/ask/ask'

   # Or more generic:
   alias ask='conda run -n ask python /path/to/ask/ask'
   ```

4. Create a `.env` file in your home directory with your API key:
   ```bash
   echo "OPENROUTER_API_KEY=your_api_key_here" > ~/.env
   ```

   Get an API key from [OpenRouter](https://openrouter.ai/)

   **Note**: You can also set `OPENROUTER_API_KEY` as an environment variable instead of using a file.

5. **Optional**: Make `ask` available system-wide:

   **On Linux:**
   ```bash
   sudo ln -s $(pwd)/ask /usr/local/bin/ask
   ```

   **On macOS:**
   Add an alias to your shell config (`~/.zshrc` or `~/.bash_profile`):
   ```bash
   # Using conda environment (if you set up conda in step 3):
   alias ask='~/miniforge3/envs/ask/bin/python ~/dev/ask/ask'

   # Or for Homebrew Python:
   alias ask='/opt/homebrew/bin/python3 /Users/yourusername/dev/ask/ask'

   # Or if the script's shebang works for you:
   alias ask='/Users/yourusername/dev/ask/ask'
   ```

   After setup, you can use `ask` from anywhere instead of `./ask`

## Usage

### Basic Syntax

```bash
ask "your question or request"
ask "question about code" file1.py file2.py
```

**Note**: Use `./ask` if running from the script directory, or just `ask` if installed system-wide.

### Command-Line Options

- **`--clear`**: Clear conversation history
  ```bash
  ./ask --clear
  ```

- **`--compact`**: Compact history into a summary (reduces token usage)
  ```bash
  ./ask --compact
  ```

- **`--summary`**: Show summary of conversation history (read-only)
  ```bash
  ./ask --summary
  ```

- **`--fast`**: Use fast model for simple queries
  ```bash
  ./ask --fast "quick question"
  ```

- **`--alt`**: Use alternative model (Kimi K2 thinking model)
  ```bash
  ./ask --alt "complex reasoning task"
  ```

- **`--model`**: Use a specific model
  ```bash
  ./ask --model "anthropic/claude-3.5-sonnet" "custom model task"
  ```

## How It Works

The `ask` script is more than a chatbot - it's a system operations agent:

1. **Understands** your request and any file/system context you provide
2. **Plans** multi-step operations (for complex or destructive tasks)
3. **Executes** using tool calls:
   - Run system commands
   - Read and write configuration files
   - Create and schedule scripts
   - Modify system settings
4. **Verifies** its work and iterates if needed
5. **Maintains context** across the conversation

All responses are stored in `~/.cache/ask/history.json` so follow-up commands work naturally.

## Configuration

Create a `.env` file in your home directory:

```bash
# ~/.env
OPENROUTER_API_KEY=your_openrouter_api_key_here
```

Alternatively, set the API key as an environment variable:
```bash
export OPENROUTER_API_KEY=your_openrouter_api_key_here
```

The tool uses [OpenRouter](https://openrouter.ai/) which provides access to multiple AI models through a single API.

### Default Models

- **Default**: `openai/gpt-5-mini` (balanced performance and cost)
- **Fast** (`--fast`): `google/gemini-2.5-flash-lite` (quick responses)
- **Alt** (`--alt`): `moonshotai/kimi-k2-thinking` (deep reasoning)
- **Custom**: Use `--model` flag to specify any OpenRouter-supported model

## Requirements

- Python 3.11 or higher
- OpenAI Python library (`pip install openai`)
- OpenRouter API key (supports multiple model providers)

## History Management

Conversation history is stored in `~/.cache/ask/history.json`. This enables contextual follow-up questions.

**Managing History**:
- `./ask --summary` - See what's in your history
- `./ask --compact` - Compress history (recommended when file gets large)
- `./ask --clear` - Start fresh

The `--summary` command will suggest compacting if your history exceeds 10KB.

## Tips for Best Results

### Be Specific
```bash
# Good
ask "find all files in /var/log larger than 500MB and compress them"

# Too vague
ask "clean up logs"
```

### Use File Context
```bash
# The AI can see the config and give better answers
ask "review this for security issues" /etc/ssh/sshd_config

# vs asking without context
ask "how do I secure SSH?"
```

### Leverage History
```bash
ask "scan /var/www for security vulnerabilities"
ask "now fix the directory permissions you found"
ask "verify the permissions are correct"
```

### Let It Plan
For complex operations, let the assistant plan before executing:
```bash
ask "migrate this server from Apache to Nginx"
# It will show you the plan and ask for confirmation
```

## Safety Features

- **Planning Mode**: Automatically engages for complex/destructive operations
- **Confirmation**: Asks before executing potentially dangerous commands
- **Self-Verification**: Can check its own work
- **History**: Full audit trail of all operations

## Troubleshooting

**"OPENROUTER_API_KEY not found"**
- Create a `~/.env` file in your home directory with your API key
- Or set it as an environment variable: `export OPENROUTER_API_KEY=your_key`
- Get a key from [openrouter.ai](https://openrouter.ai/)

**"Permission denied"**
- Make script executable: `chmod +x ./ask`

**Slow responses**
- Use `--fast` flag for simple queries
- Run `./ask --compact` to reduce history size

**Context issues**
- Use `./ask --clear` to reset conversation history
- Check that file paths are correct (relative to current directory)

## Advanced Usage

### Piping Output
```bash
ls -la | ask "explain these permissions"
journalctl -n 100 | ask "summarize error patterns"
ps aux | ask "find the top memory consumers"
```

### Monitoring & Alerts
```bash
ask "monitor system resources every 5 seconds and alert if CPU > 80%"
ask "watch /var/log/auth.log and alert on failed login attempts"
ask "create a health check script for nginx and mysql"
```

### Script Generation
```bash
ask "create a backup script for /var/www with rotation (keep last 7)" > backup.sh
ask "generate a log cleanup script that preserves last 30 days" > cleanup.sh
```

## Open Source Contribution

We welcome contributions! If you fork or use this code, please acknowledge the original author, Scott Farrell, in your project.

**Example Acknowledgment**:
```
Based on the original work by Scott Farrell.
Repository: https://github.com/sfarrell5123/ask
```

## License

This project is open source. See contribution guidelines above for attribution requirements.

---

## What Makes This Different?

Unlike typical AI chatbots, `ask` **does things**. It's not just generating text - it's executing commands, managing systems, and completing real operations in your terminal.

- ✅ **Actually executes** - Not just suggestions, but real system operations
- ✅ **Security-focused** - Audit configs, scan for issues, verify permissions
- ✅ **Safe by default** - Plans before destructive operations
- ✅ **System-aware** - Understands services, configs, and OS internals
- ✅ **Automation-ready** - Creates and schedules scripts, monitors, backups

**Try it now:**
```bash
ask "show me what you can do"
```
