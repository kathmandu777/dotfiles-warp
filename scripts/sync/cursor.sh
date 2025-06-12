#!/bin/bash

set -e  # エラー時に停止

# 色定義
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
NC='\033[0m' # 色なし

echo -e "${BLUE}Cursor設定を同期しています...${NC}"

# このスクリプトが配置されているディレクトリを取得
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES_ROOT="$(dirname "$(dirname "$SCRIPT_DIR")")"
CURSOR_DOTFILES_DIR="$DOTFILES_ROOT/dotfiles/cursor"

# Cursor設定ディレクトリ（macOS）
CURSOR_CONFIG_DIR="$HOME/Library/Application Support/Cursor/User"

# Cursor設定ディレクトリが存在するか確認
if [ ! -d "$CURSOR_CONFIG_DIR" ]; then
    echo -e "${YELLOW}Cursorがインストールされていないか、設定ディレクトリが見つかりません${NC}"
    echo -e "${YELLOW}パス: $CURSOR_CONFIG_DIR${NC}"
    exit 0
fi

# dotfiles/cursorディレクトリを作成
mkdir -p "$CURSOR_DOTFILES_DIR"

# 設定ファイルを同期
sync_file() {
    local filename="$1"
    local source_file="$CURSOR_CONFIG_DIR/$filename"
    local target_file="$CURSOR_DOTFILES_DIR/$filename"
    
    if [ -f "$source_file" ]; then
        # dotfilesに設定をコピー
        cp "$source_file" "$target_file"
        echo -e "${GREEN}  ✓ $filename を同期しました${NC}"
    else
        echo -e "${YELLOW}  - $filename が見つかりません${NC}"
    fi
}

echo -e "${BLUE}→ Cursor設定ファイルを同期しています...${NC}"
sync_file "settings.json"
sync_file "keybindings.json"

echo -e "${GREEN}✓ Cursor設定の同期が完了しました！${NC}"
echo -e "${BLUE}同期先: $CURSOR_DOTFILES_DIR${NC}"