# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# alias
source ${HOME}/dotfiles-warp/alias/common.sh
source ${HOME}/dotfiles-warp/alias/git.sh
source ${HOME}/dotfiles-warp/alias/atcoder.sh


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
alias top='btm'
alias bottom='btm'


#######################################################
# History
#######################################################
HISTFILE=$HOME/.zsh-history # 履歴を保存するファイル
HISTSIZE=100000             # メモリ上に保存する履歴のサイズ
SAVEHIST=1000000            # 上述のファイルに保存する履歴のサイズ

# share .zshhistory
setopt inc_append_history   # 実行時に履歴をファイルにに追加していく
setopt share_history        # 履歴を他のシェルとリアルタイム共有する


#######################################################
# Others
#######################################################
# local
source ${HOME}/dotfiles-warp/local.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kathmandu/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kathmandu/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kathmandu/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kathmandu/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# latex
export PATH=$PATH:/Library/TeX/texbin
export TEXMFHOME=~/texmf
export PATH=/usr/local/texlive/2024/bin/universal-darwin:$PATH

# pnpm
export PNPM_HOME="/Users/kathmandu/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# air
export PATH=$PATH:$(go env GOPATH)/bin

# starship
eval "$(starship init zsh)"

