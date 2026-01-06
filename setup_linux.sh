#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# 1. Update apt and install Python 3 + venv
echo "Installing Python 3 and venv..."
sudo apt update
sudo apt install -y python3 python3-venv python3-pip

# 2. Create venv
cd "$SCRIPT_DIR"
python3 -m venv .venv
source .venv/bin/activate

# 3. Install dependencies
python -m pip install -U pip
python -m pip install -r requirements.txt

# 4. Update shebang in ask to use venv python (only if line 1 is a shebang)
sed -i "1s|^#!.*|#!$SCRIPT_DIR/.venv/bin/python|" ask

# 5. Create global symlink
mkdir -p ~/bin
ln -sf "$SCRIPT_DIR/ask" ~/bin/ask

echo ""
echo "Setup complete!"
echo "Ensure ~/bin is in PATH: export PATH=\"\$HOME/bin:\$PATH\""
echo ""

# 6. Verify installation (also checks .env for API keys)
"$SCRIPT_DIR/ask" --help
