#!/bin/bash

set -e  # エラー時に停止

# 色定義
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # 色なし

echo -e "${BLUE}シンボリックリンクを作成しています...${NC}"

# このスクリプトが配置されているディレクトリを取得
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_DIR="$(dirname "$(dirname "$SCRIPT_DIR")")"

# バックアップ付きでシンボリックリンクを作成する関数
create_symlink() {
    local source="$1"
    local target="$2"
    
    # ターゲットが存在し、シンボリックリンクでない場合はバックアップ
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo -e "${YELLOW}  既存の $(basename "$target") をバックアップしています...${NC}"
        mv "$target" "$target.backup.$(date +%Y%m%d_%H%M%S)"
    fi
    
    # シンボリックリンクを作成
    ln -sfn "$source" "$target"
    echo -e "${GREEN}  ✓ $(basename "$source") をリンクしました${NC}"
}

# dotfilesをリンク
echo -e "${BLUE}→ 設定ファイルをリンクしています...${NC}"
create_symlink "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

# Git設定ディレクトリを作成
mkdir -p "$HOME/.config/git"

# Git設定ファイルをリンク
if [ -f "$DOTFILES_DIR/dotfiles/git/config" ]; then
    create_symlink "$DOTFILES_DIR/dotfiles/git/config" "$HOME/.config/git/config"
fi

if [ -f "$DOTFILES_DIR/dotfiles/git/ignore" ]; then
    create_symlink "$DOTFILES_DIR/dotfiles/git/ignore" "$HOME/.config/git/ignore"
fi

# starship設定が存在する場合はリンク
if [ -f "$DOTFILES_DIR/starship.toml" ]; then
    create_symlink "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"
fi

echo -e "${GREEN}✓ すべてのシンボリックリンクが正常に作成されました！${NC}"
