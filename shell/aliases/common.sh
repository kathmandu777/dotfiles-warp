#!/bin/bash

# ===============================================
# Common Aliases
# ===============================================

# ----------------------------------------------
# Quick Commands
# ----------------------------------------------
alias c='clear'
alias tf='terraform'

# ----------------------------------------------
# Editor Shortcuts
# ----------------------------------------------
alias cs='cursor .'
alias vs='cursor .'
alias code='cursor'

# ----------------------------------------------
# Directory Navigation
# ----------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Quick directory access
alias dev='cd $HOME/dev'
alias p='cd $HOME/dev/projects'
alias dot='cd $HOME/dotfiles-warp'
alias dl='cd $HOME/Downloads'
alias dt='cd $HOME/Desktop'

# ----------------------------------------------
# File Operations (using modern tools)
# ----------------------------------------------
# These are overridden by modern tools in .zshrc
# but kept as fallback if tools are not installed
alias ll='ls -lh'
alias la='ls -ah'
alias lsa='ls -lah'

# ----------------------------------------------
# Development Tools
# ----------------------------------------------

# Python
alias py='python'
alias py3='python3'
alias pip='pip3'
alias makevenv='python -m venv .venv'
alias activate='source .venv/bin/activate'

# Docker
alias d='docker'
alias dc='docker-compose'
alias dps='docker ps'
alias dpsa='docker ps -a'

# ----------------------------------------------
# System Operations
# ----------------------------------------------
alias ports='netstat -tulnp 2>/dev/null | grep LISTEN || lsof -iTCP -sTCP:LISTEN -P'
alias myip='curl -s https://api.ipify.org && echo'
alias localip='ipconfig getifaddr en0'

# ----------------------------------------------
# Safe file operations
# ----------------------------------------------
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
