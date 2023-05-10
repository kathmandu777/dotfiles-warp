# dotfiles-warp

## Overview
This is dotfiles repo for warp user.

## Environment
- OS: macOS (13.2.1)
- Shell: zsh (5.8.1)
- Terminal: warp (v0.2023.04.04.08.03.stable_01)

## Installation
1. Install warp
2. Clone this repo
    ```zsh
    cd ~
    git clone https://github.com/kathmandu777/dotfiles-warp.git
    ```
3. Setup
    ```zsh
    cd ~/dotfiles-warp
    make
    ```

## Tools
- version management: [asdf](https://asdf-vm.com/)
- package manager: [Homebrew](https://brew.sh/)
- shell: [zsh](https://www.zsh.org/)
- terminal: [warp](https://warp.dev/)
- file manager: [lsd](https://github.com/lsd-rs/lsd)
etc...(WIP)

## License
WIP

## Note
- To use 'lsd' command with icons, you need to install [Nerd Fonts](https://www.nerdfonts.com/) or [HackGen](https://github.com/yuru7/HackGen).
- Install 'enhancd' command by yourself.
- To use below command, you need to make dir by yourself.
    ```sh
    # common.sh

    alias dev='cd $HOME/dev'
    alias p='cd $HOME/dev/projects'`
    ```