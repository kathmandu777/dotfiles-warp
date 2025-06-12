.PHONY: all install update clean help macos sync sync-brew sync-vscode sync-cursor

# デフォルトターゲット
all: install

# 完全インストール
install: init brew link asdf-plugins shell-setup
	@echo "\033[0;32m✓ Dotfilesインストール完了！\033[0m"
	@echo "\033[0;33mターミナルを再起動するか、以下を実行してください: source ~/.zshrc\033[0m"

# システム初期化（前提条件のインストール）
init:
	@echo "\033[0;34m→ システムを初期化しています...\033[0m"
	@bash scripts/setup/init.sh
	@echo "\033[0;32m✓ システム初期化完了\033[0m"

# Homebrewパッケージのインストール
brew: init
	@echo "\033[0;34m→ Homebrewパッケージをインストールしています...\033[0m"
	@brew bundle --file=scripts/Brewfile
	@echo "\033[0;32m✓ Homebrewパッケージインストール完了\033[0m"

# シンボリックリンクの作成
link:
	@echo "\033[0;34m→ シンボリックリンクを作成しています...\033[0m"
	@bash scripts/setup/symlink.sh
	@echo "\033[0;32m✓ シンボリックリンク作成完了\033[0m"

# asdfプラグインのインストール
asdf-plugins: brew
	@echo "\033[0;34m→ asdfプラグインをインストールしています...\033[0m"
	@bash scripts/setup/asdf.sh
	@echo "\033[0;32m✓ asdfプラグインインストール完了\033[0m"

# シェル環境のセットアップ
shell-setup:
	@echo "\033[0;34m→ シェル環境をセットアップしています...\033[0m"
	@mkdir -p $(HOME)/dev/projects
	@mkdir -p $(HOME)/.config
	@touch $(HOME)/.zsh-history
	@echo "\033[0;32m✓ シェル環境セットアップ完了\033[0m"

# すべてを更新
update:
	@echo "\033[0;34m→ Homebrewを更新しています...\033[0m"
	@brew update && brew upgrade
	@echo "\033[0;34m→ asdfプラグインを更新しています...\033[0m"
	@asdf plugin update --all
	@echo "\033[0;32m✓ 更新完了\033[0m"

# バックアップファイルのクリーンアップ
clean:
	@echo "\033[0;34m→ クリーンアップしています...\033[0m"
	@find $(HOME) -name "*.backup.*" -type f -delete 2>/dev/null || true
	@echo "\033[0;32m✓ クリーンアップ完了\033[0m"

# macOS設定の適用
macos:
	@echo "\033[0;34m→ macOS設定を適用しています...\033[0m"
	@bash scripts/setup/macos.sh
	@echo "\033[0;32m✓ macOS設定適用完了\033[0m"

# 設定の同期（現在の設定をdotfilesに反映）
sync: sync-brew sync-vscode sync-cursor
	@echo "\033[0;32m✓ すべての設定同期が完了しました！\033[0m"

# Brewfileの自動生成
sync-brew:
	@echo "\033[0;34m→ Brewfileを同期しています...\033[0m"
	@bash scripts/sync/brewfile.sh

# VSCode設定の同期
sync-vscode:
	@echo "\033[0;34m→ VSCode設定を同期しています...\033[0m"
	@bash scripts/sync/vscode.sh

# Cursor設定の同期
sync-cursor:
	@echo "\033[0;34m→ Cursor設定を同期しています...\033[0m"
	@bash scripts/sync/cursor.sh

# ヘルプ表示
help:
	@echo "macOS + Warp Terminal用 Dotfiles管理"
	@echo ""
	@echo "使い方: make [ターゲット]"
	@echo ""
	@echo "ターゲット:"
	@echo "  install    - 完全インストール（デフォルト）"
	@echo "  update     - HomebrewとasdfプラグインをM更新"
	@echo "  sync       - 現在の設定をdotfilesに同期"
	@echo "  sync-brew  - Brewfileを自動生成"
	@echo "  sync-vscode- VSCode設定を同期"
	@echo "  sync-cursor- Cursor設定を同期"
	@echo "  clean      - バックアップファイルを削除"
	@echo "  macos      - macOSシステム設定を適用"
	@echo "  help       - このヘルプメッセージを表示"