# CLAUDE.md - dotfiles開発ガイド

このファイルは、Claude Codeがこのdotfilesリポジトリを理解し、適切に開発を支援するためのガイドです。

## 🎯 プロジェクトの目的

このdotfilesは、macOS（Apple Silicon）+ Warp Terminal環境を完全に自動セットアップし、開発環境を一元管理することを目的としています。

## 🏗️ アーキテクチャ

### 基本方針

- **言語**: Bash/Zsh
- **パッケージ管理**: Homebrew（システム全体）、asdf（プログラミング言語）
- **設定管理**: シンボリックリンクによる管理
- **自動化**: Makefileによる一括セットアップ

### ディレクトリ構造

```
~/dotfiles-warp/
├── Makefile              # メインのセットアップスクリプト
├── README.md             # ユーザー向けドキュメント
├── CLAUDE.md             # このファイル（開発者向け）
├── .zshrc                # Zsh設定
├── starship.toml         # プロンプト設定
├── dotfiles/             # symlink対象ファイル（.で始まるファイル）
│   ├── git/
│   │   ├── config        # Git設定
│   │   └── ignore        # グローバルgitignore
│   ├── vscode/           # VSCode設定
│   │   ├── settings.json
│   │   └── keybindings.json
│   └── cursor/           # Cursor設定
│       ├── settings.json
│       └── keybindings.json
├── scripts/              # セットアップ・メンテナンススクリプト
│   ├── setup/
│   │   ├── init.sh       # 初期化スクリプト
│   │   ├── symlink.sh    # シンボリックリンク作成
│   │   ├── asdf.sh       # asdf設定
│   │   └── macos.sh      # macOS設定
│   ├── sync/             # 自動同期スクリプト
│   │   ├── brewfile.sh   # Brewfile自動生成
│   │   ├── vscode.sh     # VSCode設定同期
│   │   └── cursor.sh     # Cursor設定同期
│   └── Brewfile          # Homebrewパッケージリスト
└── shell/                # シェル関連設定
    ├── aliases/
    │   ├── common.sh     # 共通エイリアス
    │   └── git.sh        # Gitエイリアス
    └── functions/        # シェル関数（将来用）
```

## 🛠️ 主要コンポーネント

### 1. パッケージ管理

#### Homebrew (`scripts/Brewfile`)

- **役割**: システム全体のパッケージ管理
- **管理対象**:
  - CLIツール（bat, ripgrep, fd等）
  - 開発ツール（git, gh, starship等）
  - GUI アプリケーション（Warp, Raycast等）
  - フォント（Nerd Fonts）

#### asdf (`scripts/setup/asdf.sh`)

- **役割**: プログラミング言語のバージョン管理
- **管理対象**:
  - Node.js（npm含む）
  - Python
  - Ruby
  - Go
  - Rust
  - Java

### 2. シェル設定

#### `.zshrc`

- **セクション構成**:
  1. 環境設定（Homebrew, asdf）
  2. ヒストリー設定
  3. PATH設定
  4. エイリアス読み込み（shell/aliases/から）
  5. 関数定義（npm_global_install等）
  6. ツール統合（Starship, Google Cloud SDK）

#### 重要な関数

- `asdf_reshim_nodejs()`: npm globalパッケージインストール後の再読み込み
- `npm_global_install()`: npm globalインストールの自動reshim

### 3. Git設定

#### `dotfiles/git/config`

- ユーザー情報
- エディタ設定（vim）
- AWS secrets検出設定
- difftastic統合

#### `dotfiles/git/ignore`

- グローバルgitignore設定
- IDE固有ファイル（.vscode/, .idea/）
- OS固有ファイル（.DS_Store等）

### 4. IDE設定管理

#### VSCode (`dotfiles/vscode/`)

- `settings.json`: エディタ設定
- `keybindings.json`: キーバインド設定
- 自動同期スクリプト（`scripts/sync/vscode.sh`）

#### Cursor (`dotfiles/cursor/`)

- `settings.json`: エディタ設定
- `keybindings.json`: キーバインド設定
- 自動同期スクリプト（`scripts/sync/cursor.sh`）

## 📝 開発時の注意事項

### コメントは日本語で

すべてのスクリプトファイルのコメントは日本語で記述してください。

### エラーハンドリング

- `set -e`を使用してエラー時に停止
- 色付き出力でユーザーフレンドリーに

### バックアップ

既存ファイルを上書きする前に、タイムスタンプ付きバックアップを作成

### テスト方法

```bash
# ドライラン
make -n

# 部分的なテスト
make link  # シンボリックリンクのみ
make brew  # Homebrewパッケージのみ
```

## 🔧 よく使うコマンド

### セットアップ関連

```bash
make              # 完全インストール
make update       # アップデート
make clean        # クリーンアップ
make sync         # 現在の設定をdotfilesに同期
```

### 同期関連

```bash
make sync-brew    # Brewfileを自動生成
make sync-vscode  # VSCode設定を同期
make sync-cursor  # Cursor設定を同期
```

### 開発関連

```bash
# 新しいエイリアスを追加
vi shell/aliases/common.sh

# Brewfileに新しいパッケージを追加（または自動同期）
make sync-brew

# 設定を再読み込み
source ~/.zshrc
```

## 🚀 今後の拡張予定

1. **macOS設定の自動化**
   - Dock設定
   - Finder設定
   - キーボード設定
   - セキュリティ設定

2. **アプリケーション設定の拡張**
   - Karabiner-Elements設定
   - Raycast設定
   - Warp Terminal設定

3. **開発環境設定**
   - Docker設定
   - AWS CLI設定
   - データベース接続設定

## 🐛 トラブルシューティング

### npm globalコマンドが見つからない

```bash
asdf reshim nodejs
# または
npm_global_install <package>  # 自動でreshimされる
```

### Homebrewのパスが通らない

```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### asdfコマンドが見つからない

```bash
brew install asdf
```

## 📚 参考資料

- [Homebrew Documentation](https://brew.sh)
- [asdf Documentation](https://asdf-vm.com)
- [Starship Documentation](https://starship.rs)
- [Warp Terminal](https://www.warp.dev)

---

最終更新: 2025年6月12日
作成者: @kathmandu777
