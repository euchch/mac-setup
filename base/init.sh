#!/bin/bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null 2>&1

# Install brew formulas
brew install --formula $(cat brew-formulas.list) --quiet > /dev/null 2>&1

# Install brew cask formulas
brew install --cask $(cat brew-cask-formulas.list) --quiet > /dev/null 2>&1

# Install Visual Studio Code extensions
cat vscode-plugins | xargs -n 1 code --install-extension --force --silent > /dev/null 2>&1