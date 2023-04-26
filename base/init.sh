#!/bin/zsh

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

# Add Homebrew executable to path if it doesn't exist
if ! grep -qxF 'export PATH="/opt/homebrew/bin:$PATH"' ~/.zshrc; then
    echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.zshrc
fi

# Fixing homebrew permissions (it happens sometimes - it's always good to run it)
sudo chown -R $(whoami) $(brew --prefix)/*

# Install brew formulas
brew install --formula $(cat brew-formulas.list) --quiet

# Install brew cask formulas
brew install --cask $(cat brew-cask-formulas.list) --quiet

# Install Visual Studio Code extensions
cat vscode-plugins.list | xargs -n 1 -I{} code --force --install-extension={}

./init-golang.sh
./init-git.sh