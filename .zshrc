# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# alias
source ${HOME}/dotfiles-warp/alias/common.sh
source ${HOME}/dotfiles-warp/alias/git.sh

#######################################################
# モダンコマンド
# https://zenn.dev/the_exile/articles/5176b7a5c29bce
#######################################################

# dust https://github.com/bootandy/dust
alias du='dust --reverse'

# bat https://github.com/sharkdp/bat
alias cat='bat'

# lsd
alias ls='lsd'

# duf https://github.com/muesli/duf
alias df='duf'

# procs https://github.com/dalance/procs
alias ps='procs'

# bottom https://github.com/ClementTsang/bottom
alias top='bottom'


# local
source ${HOME}/dotfiles-warp/local.sh
