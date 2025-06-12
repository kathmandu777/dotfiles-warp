# ===============================================
# macOS + Warp Terminal用 Zsh設定
# ===============================================

# ----------------------------------------------
# 環境設定
# ----------------------------------------------

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# asdf バージョン管理ツール
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# ----------------------------------------------
# シェル履歴設定
# ----------------------------------------------
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000
setopt inc_append_history   # 即座に履歴ファイルに追加
setopt share_history        # シェル間で履歴を共有

# ----------------------------------------------
# PATH設定
# ----------------------------------------------

# pnpm
export PNPM_HOME="/Users/kathmandu/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Goバイナリ
export PATH=$PATH:$(go env GOPATH)/bin

# PostgreSQL
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# ----------------------------------------------
# エイリアス
# ----------------------------------------------

# エイリアスファイルを読み込み
source ${HOME}/dotfiles-warp/shell/aliases/common.sh
source ${HOME}/dotfiles-warp/shell/aliases/git.sh

# モダンCLIツール（従来のコマンドを置き換え）
alias du='dust --reverse'
alias cat='bat'
alias ls='lsd'
alias df='duf'
alias ps='procs'
alias top='btm'
alias bottom='btm'

# ----------------------------------------------
# 関数定義
# ----------------------------------------------

# npm globalパッケージ用のasdf reshimヘルパー
asdf_reshim_nodejs() {
    asdf reshim nodejs
    echo "✓ nodejs reshim完了 - グローバルnpmパッケージが利用可能になりました"
}

# npm globalインストール後に自動でreshim
npm_global_install() {
    npm install -g "$@" && asdf_reshim_nodejs
}

# ----------------------------------------------
# ツール統合
# ----------------------------------------------

# Starshipプロンプト
eval "$(starship init zsh)"

# Google Cloud SDK
if [ -f "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc" ]; then
    source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
fi

if [ -f "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc" ]; then
    source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
fi
