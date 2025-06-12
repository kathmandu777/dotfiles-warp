#!/bin/bash

# ===============================================
# macOS システム設定スクリプト
# ===============================================

# 色定義
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}macOSシステム設定を適用しています...${NC}"

# ----------------------------------------------
# 一般設定
# ----------------------------------------------

echo -e "${BLUE}→ 一般設定...${NC}"

# ダークモードを有効化
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# スクロールバーを自動的に表示
defaults write NSGlobalDomain AppleShowScrollBars -string "Automatic"

# 拡張子を常に表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# ----------------------------------------------
# Dock設定
# ----------------------------------------------

echo -e "${BLUE}→ Dock設定...${NC}"

# Dockを自動的に隠す
defaults write com.apple.dock autohide -bool true

# Dockの表示/非表示の遅延を削除
defaults write com.apple.dock autohide-delay -float 0

# Dockのアニメーション時間を高速化
defaults write com.apple.dock autohide-time-modifier -float 0.5

# 最小化エフェクトをスケールに
defaults write com.apple.dock mineffect -string "scale"

# 最近使ったアプリケーションを表示しない
defaults write com.apple.dock show-recents -bool false

# ----------------------------------------------
# Finder設定
# ----------------------------------------------

echo -e "${BLUE}→ Finder設定...${NC}"

# デフォルトをリスト表示に
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# パスバーを表示
defaults write com.apple.finder ShowPathbar -bool true

# ステータスバーを表示
defaults write com.apple.finder ShowStatusBar -bool true

# タイトルバーにフルパスを表示
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# 検索時に現在のフォルダから開始
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# ファイル拡張子変更時の警告を無効化
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# ゴミ箱を空にする時の警告を無効化
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# デスクトップに外部ドライブを表示
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# ----------------------------------------------
# キーボード設定
# ----------------------------------------------

echo -e "${BLUE}→ キーボード設定...${NC}"

# キーリピートを高速化
defaults write NSGlobalDomain KeyRepeat -int 2

# キーリピート開始までの時間を短縮
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# 自動大文字変換を無効化
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# スペルチェックを無効化
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# ----------------------------------------------
# トラックパッド設定
# ----------------------------------------------

echo -e "${BLUE}→ トラックパッド設定...${NC}"

# タップでクリックを有効化
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# 三本指でドラッグを有効化
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# ----------------------------------------------
# スクリーンショット設定
# ----------------------------------------------

echo -e "${BLUE}→ スクリーンショット設定...${NC}"

# スクリーンショットの保存先をデスクトップに
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# スクリーンショットのファイル形式をPNGに
defaults write com.apple.screencapture type -string "png"

# スクリーンショットの影を無効化
defaults write com.apple.screencapture disable-shadow -bool true

# ----------------------------------------------
# その他の設定
# ----------------------------------------------

echo -e "${BLUE}→ その他の設定...${NC}"

# 起動音を無効化
sudo nvram SystemAudioVolume=" "

# クラッシュレポーターを無効化
defaults write com.apple.CrashReporter DialogType -string "none"

# .DS_Storeファイルをネットワークドライブに作成しない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Time Machineの新しいディスクへの使用確認を無効化
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# ----------------------------------------------
# 再起動が必要な設定の適用
# ----------------------------------------------

echo -e "${GREEN}✓ macOS設定の適用が完了しました${NC}"
echo -e "${YELLOW}※ 一部の設定は再起動後に有効になります${NC}"

# 影響を受けるアプリケーションを再起動
killall Dock
killall Finder
killall SystemUIServer

echo -e "${GREEN}✓ 関連アプリケーションを再起動しました${NC}"