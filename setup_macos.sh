#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# 1. Check/install Homebrew (automatically installs Xcode CLT if needed)
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add brew to PATH for this session (Apple Silicon vs Intel)
    if [[ -f /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -f /usr/local/bin/brew ]]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi
fi

# 2. Install latest Python via Homebrew
brew install python3 2>/dev/null || brew upgrade python3 2>/dev/null || true

# 3. Create venv
cd "$SCRIPT_DIR"
python3 -m venv .venv
source .venv/bin/activate

# 4. Install dependencies
python -m pip install -U pip
python -m pip install -r requirements.txt

# 5. Update shebang in ask to use venv python (only if line 1 is a shebang)
sed -i '' "1s|^#!.*|#!$SCRIPT_DIR/.venv/bin/python|" ask

# 6. Create global symlink
mkdir -p ~/bin
ln -sf "$SCRIPT_DIR/ask" ~/bin/ask

echo ""
echo "Setup complete!"
echo "Ensure ~/bin is in PATH: export PATH=\"\$HOME/bin:\$PATH\""
echo ""

# 7. Verify installation (also checks .env for API keys)
"$SCRIPT_DIR/ask" --help
