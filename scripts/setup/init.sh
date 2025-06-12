#!/bin/bash

set -e  # エラー時に停止

# 色定義
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # 色なし

echo -e "${BLUE}macOS環境を初期化しています...${NC}"

# オペレーティングシステムの確認
if [ "$(uname)" != "Darwin" ] ; then
    echo -e "${RED}エラー: このスクリプトはmacOS専用です！${NC}"
    exit 1
fi

echo -e "${BLUE}→ macOS $(sw_vers -productVersion) を検出しました${NC}"

# アーキテクチャの確認
ARCH=$(uname -m)
echo -e "${BLUE}→ アーキテクチャ: $ARCH${NC}"

# Xcode Command Line Toolsのインストール（必要な場合）
if ! xcode-select -p &> /dev/null; then
    echo -e "${YELLOW}→ Xcode Command Line Toolsをインストールしています...${NC}"
    xcode-select --install
    echo -e "${YELLOW}  インストールを完了してから、再度makeを実行してください。${NC}"
    exit 0
else
    echo -e "${GREEN}✓ Xcode Command Line Toolsはすでにインストール済みです${NC}"
fi

# Apple Silicon用のRosetta 2をインストール
if [ "$ARCH" = "arm64" ] && ! pgrep -q oahd; then
    echo -e "${YELLOW}→ Apple Silicon用のRosetta 2をインストールしています...${NC}"
    /usr/sbin/softwareupdate --install-rosetta --agree-to-license
fi

# Homebrewのインストール
if ! command -v brew &> /dev/null ; then
    echo -e "${YELLOW}→ Homebrewをインストールしています...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # このセッション用にHomebrewをPATHに追加
    if [ "$ARCH" = "arm64" ] ; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        eval "$(/usr/local/bin/brew shellenv)"
    fi
    
    echo -e "${GREEN}✓ Homebrewが正常にインストールされました${NC}"
else
    echo -e "${GREEN}✓ Homebrewはすでにインストール済みです${NC}"
    echo -e "${BLUE}→ Homebrewを更新しています...${NC}"
    brew update
fi

# 標準ディレクトリの作成
echo -e "${BLUE}→ 標準ディレクトリを作成しています...${NC}"
mkdir -p "$HOME/dev/projects"
mkdir -p "$HOME/dev/ribura"
mkdir -p "$HOME/.config"

echo -e "${GREEN}✓ 初期化が完了しました！${NC}"
