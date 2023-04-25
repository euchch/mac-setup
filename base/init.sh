#!/bin/bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install brew formulas
brew install $(cat brew-formulas.list)

# Install brew cask formulas
brew install --cask $(cat brew-cask-formulas.list)

# Install Visual Studio Code extensions
cat vscode-plugins | xargs -n 1 code --install-extension