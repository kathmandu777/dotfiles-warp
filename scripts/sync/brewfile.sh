#!/bin/bash

set -e  # エラー時に停止

# 色定義
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # 色なし

echo -e "${BLUE}Brewfileを現在のインストール済みパッケージから生成しています...${NC}"

# このスクリプトが配置されているディレクトリを取得
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BREWFILE_PATH="$(dirname "$SCRIPT_DIR")/Brewfile"

# 現在のBrewfileをバックアップ
if [ -f "$BREWFILE_PATH" ]; then
    cp "$BREWFILE_PATH" "$BREWFILE_PATH.backup.$(date +%Y%m%d_%H%M%S)"
    echo -e "${GREEN}  ✓ 既存のBrewfileをバックアップしました${NC}"
fi

# 新しいBrewfileを生成
brew bundle dump --file="$BREWFILE_PATH" --force

echo -e "${GREEN}✓ Brewfileが正常に更新されました！${NC}"
echo -e "${BLUE}パス: $BREWFILE_PATH${NC}"