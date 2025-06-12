# dotfiles-warp

macOS（Apple Silicon）+ Warp Terminal環境を完全自動化するdotfilesリポジトリ。

## 🚀 クイックスタート

```bash
git clone https://github.com/kathmandu777/dotfiles-warp.git ~/dotfiles-warp
cd ~/dotfiles-warp
make
```

これだけで開発環境が整います！

## 📋 必要条件

- macOS 13以降（Apple Silicon推奨）
- [Warp Terminal](https://www.warp.dev/)
- Git
- インターネット接続

## 🎯 このdotfilesで管理されるもの

### 1️⃣ パッケージ管理

#### **Homebrew** - システム全体のパッケージマネージャー

- CLIツール（200以上のパッケージ）
- GUIアプリケーション
- フォント
- 開発ツール

#### **asdf** - プログラミング言語バージョン管理

- Node.js（npm含む）
- Python
- Ruby
- Go
- Rust
- Java
- Terraform

### 2️⃣ インストールされるアプリケーション

#### **開発ツール**

- **エディタ**: Cursor, VS Code
- **ターミナル**: Warp（最新のAI搭載ターミナル）
- **Git**: gh（GitHub CLI）、git-secrets
- **データベース**: DBeaver
- **コンテナ**: Docker Desktop
- **API開発**: HTTPie

#### **生産性向上ツール**

- **ランチャー**: Raycast（Spotlight代替）
- **ウィンドウ管理**: AutoRaise
- **キーボード**: Karabiner-Elements
- **翻訳**: DeepL

#### **コミュニケーション**

- Slack, Discord, LINE, Teams, Zoom

### 3️⃣ モダンCLIツール（従来のコマンドを置き換え）

| 従来のコマンド | 新しいコマンド | 特徴 |
|--------------|--------------|------|
| `ls` | `lsd` | アイコンと色付き表示 |
| `cat` | `bat` | シンタックスハイライト |
| `grep` | `ripgrep (rg)` | 高速検索 |
| `find` | `fd` | 使いやすい構文 |
| `du` | `dust` | 視覚的なディスク使用量 |
| `df` | `duf` | モダンなディスク情報 |
| `ps` | `procs` | ツリー表示とフィルタリング |
| `top` | `bottom (btm)` | グラフィカルなシステムモニタ |
| `man` | `tldr` | 実用的な例付きヘルプ |
| `diff` | `difftastic` | 構造を理解する差分表示 |

### 4️⃣ シェル環境

#### **Zsh設定** (`.zshrc`)

- 履歴管理（100,000行）
- PATH最適化
- エイリアス設定
- 関数定義（npm_global_install等）

#### **プロンプト**

- Starship（高速でカスタマイズ可能）
- Git情報表示
- 言語バージョン表示

### 5️⃣ macOSシステム設定

`make macos`で以下が自動設定されます：

- **一般**: ダークモード、拡張子表示
- **Dock**: 自動非表示、高速アニメーション
- **Finder**: リスト表示、パスバー表示
- **キーボード**: 高速キーリピート
- **トラックパッド**: タップでクリック、三本指ドラッグ
- **スクリーンショット**: PNG形式、影なし

## 📁 ディレクトリ構造

```
~/dotfiles-warp/
├── Makefile              # メインセットアップ
├── README.md             # このファイル
├── CLAUDE.md             # 開発者向けドキュメント
├── .zshrc                # Zsh設定
├── .gitconfig            # Git設定
├── .gitignore            # グローバルgitignore  
├── starship.toml         # プロンプト設定
├── alias/                # エイリアス定義
│   ├── common.sh         # 共通ショートカット
│   ├── git.sh            # Gitエイリアス
│   └── atcoder.sh        # AtCoder用
├── bin/                  # セットアップスクリプト
│   ├── init.sh           # システム初期化
│   ├── link.sh           # シンボリックリンク作成
│   ├── asdf-setup.sh     # asdfプラグイン設定
│   └── Brewfile          # Homebrewパッケージ
├── config/               # アプリケーション設定
│   └── macos/            # macOS設定
│       └── defaults.sh   # システム設定スクリプト
└── local/                # ローカル専用スクリプト
```

## 🔧 使い方

### Makefileコマンド

```bash
make              # 完全インストール
make update       # Homebrewとasdfの更新
make clean        # バックアップファイルの削除
make macos        # macOS設定の適用
make help         # ヘルプ表示
```

### よく使うショートカット

#### ディレクトリ移動

- `dev` → `~/dev`へ移動
- `p` → `~/dev/projects`へ移動  
- `dot` → dotfilesディレクトリへ移動
- `dl` → ダウンロードフォルダへ移動
- `dt` → デスクトップへ移動

#### エディタ

- `cs` / `vs` → 現在のディレクトリをCursorで開く
- `code` → Cursorのエイリアス

#### 開発ツール

- `d` → docker
- `dc` → docker-compose
- `k` → kubectl
- `tf` → terraform
- `py` → python
- `activate` → Python仮想環境を有効化

### npm グローバルパッケージのインストール

asdfでNode.jsを管理している場合：

```bash
# 推奨：自動reshim機能付き
npm_global_install <package-name>

# 手動の場合
npm install -g <package-name>
asdf reshim nodejs
```

## 🛠️ トラブルシューティング

### よくある問題と解決方法

#### npm globalコマンドが見つからない

```bash
asdf reshim nodejs
```

#### lsdでアイコンが表示されない

Warpの設定でフォントをHackGen Nerdに変更してください。

#### Homebrewのパスが通らない

```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

#### macOS設定が反映されない

一部の設定は再起動が必要です：

```bash
sudo reboot
```

## 📚 各ツールの使い方

### モダンCLIツール

#### **bat** - ファイル表示

```bash
bat README.md              # シンタックスハイライト付き
bat -A file.txt           # 非表示文字も表示
bat --style=numbers file  # 行番号付き
```

#### **ripgrep** - 高速検索

```bash
rg "検索文字列"            # カレントディレクトリ以下を検索
rg -i "pattern"           # 大文字小文字無視
rg -t py "def"            # Pythonファイルのみ検索
```

#### **fd** - ファイル検索

```bash
fd "\.py$"                # .pyファイルを検索
fd -H pattern             # 隠しファイルも含む
fd -e md                  # 拡張子で検索
```

#### **fzf** - ファジーファインダー

```bash
# ファイル検索して開く
vim $(fzf)

# 履歴検索（Ctrl+R）
# ファイル内容プレビュー付き検索
fzf --preview 'bat {}'
```

### asdf - バージョン管理

```bash
# プラグイン一覧
asdf plugin list all

# Node.js最新版をインストール
asdf install nodejs latest
asdf global nodejs latest

# プロジェクト別バージョン指定
asdf local python 3.11.6
```

## 🔄 アップデート方法

```bash
cd ~/dotfiles-warp
git pull
make update
```

## 🎨 カスタマイズ

### 独自の設定を追加

1. **ローカル設定**: `local.sh`に追加
2. **エイリアス**: `alias/`ディレクトリに新規ファイル作成
3. **パッケージ**: `bin/Brewfile`に追加

### プロンプトのカスタマイズ

`starship.toml`を編集してプロンプトをカスタマイズできます。

## 📄 ライセンス

MIT License

## 🤝 貢献

1. このリポジトリをフォーク
2. 機能ブランチを作成
3. 変更をコミット
4. ブランチをプッシュ
5. プルリクエストを作成

---

作成者: [@kathmandu777](https://github.com/kathmandu777)
最終更新: 2025年6月
