#!/bin/zsh

# Check operating system
if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

# Install Rosetta 2 for Apple Silicon
# if [ "$(uname -m)" = "arm64" ] ; then
#   /usr/sbin/softwareupdate --install-rosetta --agree-to-license
# fi

# Install xcode
# xcode-select --install

# Install brew
if ! command -v brew &> /dev/null ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if [ "$(uname -m)" = "arm64" ] ; then
        eval "$(/opt/homebrew/bin/brew shellenv)" > /dev/null
    fi
else
    echo "brew is already installed"
    brew update
fi