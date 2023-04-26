#!/bin/zsh

if ! xcode-select -p &> /dev/null; then
    xcode-select --install
fi

FILE=~/.zshrc

# Create the go-workspace directory
mkdir -p $HOME/go-workspace
mkdir -p $HOME/go-workspace/{src,pkg,bin}


if ! grep -q 'export GOROOT=$(which go)' $FILE; then
    echo 'export GOROOT=$(which go)'
fi

# Set the GOPATH environment variable
if ! grep -q 'export GOPATH=$HOME/go-workspace' $FILE; then
    echo 'export GOPATH=$HOME/go-workspace' >> $FILE
fi

if ! grep -q 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' $FILE; then
    echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> $FILE
fi

echo "go-workspace directory set up successfully!"