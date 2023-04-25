#!/bin/zsh

# Add Homebrew executable to path if it doesn't exist
if ! grep -qxF 'export PATH="/usr/local/bin:$PATH"' ~/.zshrc; then
    echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.zshrc
fi

# Update Homebrew if it's already installed, otherwise install it
if command -v brew >/dev/null 2>&1; then
    brew update
else
    /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Test if brew file exists before ln command
if [ ! -f "/opt/homebrew/bin/brew" ]; then
    echo "Error: Homebrew executable not found."
    exit 1
fi

sudo ln -s /opt/homebrew/bin/brew /usr/local/bin/

# Install brew formulas
brew install --formula $(cat brew-formulas.list) --quiet

# Install brew cask formulas
brew install --cask $(cat brew-cask-formulas.list) --quiet

# Install Visual Studio Code extensions
cat vscode-plugins | xargs -n 1 code --install-extension --force --silent