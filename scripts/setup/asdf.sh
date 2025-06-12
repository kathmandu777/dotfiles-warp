#!/bin/bash

# asdfプラグインセットアップスクリプト
echo "asdfプラグインをセットアップしています..."

# プログラミング言語プラグイン
plugins=(
    "nodejs https://github.com/asdf-vm/asdf-nodejs.git"
    "python https://github.com/danhper/asdf-python.git"
    "ruby https://github.com/asdf-vm/asdf-ruby.git"
    "golang https://github.com/kennyp/asdf-golang.git"
    "rust https://github.com/asdf-community/asdf-rust.git"
    "java https://github.com/halcyon/asdf-java.git"
)

# プラグインをインストール
for plugin_info in "${plugins[@]}"; do
    plugin_name=$(echo $plugin_info | cut -d' ' -f1)
    plugin_url=$(echo $plugin_info | cut -d' ' -f2)
    
    if ! asdf plugin list | grep -q "^${plugin_name}$"; then
        echo "${plugin_name}プラグインをインストールしています..."
        asdf plugin add "${plugin_name}" "${plugin_url}"
    else
        echo "${plugin_name}プラグインはすでにインストールされています"
    fi
done

# インストール手順の表示
echo ""
echo "言語バージョンをインストールするには:"
echo "  asdf install nodejs latest"
echo "  asdf global nodejs latest"
echo ""
echo "npm globalパッケージをインストールした後は:"
echo "  npm_global_install <package>   # 自動でreshimされます"
echo "  # または手動で:"
echo "  npm install -g <package>"
echo "  asdf reshim nodejs"