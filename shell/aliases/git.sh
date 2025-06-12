#!/bin/bash

# ===============================================
# Git エイリアス
# ===============================================

# ----------------------------------------------
# 基本コマンド
# ----------------------------------------------
alias g='git'
alias gs='git status'
alias gss='git status --short'

# ----------------------------------------------
# ログ表示
# ----------------------------------------------
alias gl='git log'
alias glo='git log --oneline'
alias glg='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gll='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --all'

# ----------------------------------------------
# ファイル操作
# ----------------------------------------------
alias ga='git add'
alias gaa='git add --all'
alias gap='git add -p'  # 対話的に追加

# ----------------------------------------------
# ブランチ操作
# ----------------------------------------------
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gbnm='git branch --no-merged'
alias gbr='git branch -r'

# マージ済みブランチを削除（main, master, develop, dev, releaseを除く）
alias gbrm="git branch --merged | egrep -v '\*|main|master|develop|dev|release' | xargs -n 1 git branch -d"

# ----------------------------------------------
# チェックアウト
# ----------------------------------------------
alias gc='git checkout'
alias gcb='git checkout -b'
alias gcm='git checkout main || git checkout master'
alias gcd='git checkout develop || git checkout dev'

# ----------------------------------------------
# コミット
# ----------------------------------------------
alias gct='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcan='git commit --amend --no-edit'
alias gcf='git commit --fixup'

# ----------------------------------------------
# 差分表示
# ----------------------------------------------
alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff HEAD'
alias gds='git diff --stat'

# ----------------------------------------------
# フェッチ・プル
# ----------------------------------------------
alias gf='git fetch'
alias gfa='git fetch --all'
alias gfo='git fetch origin'

alias gpl='git pull'
alias gplr='git pull --rebase'
alias gplf='git fetch && git reset --hard origin/$(git symbolic-ref --short HEAD)'

# ----------------------------------------------
# プッシュ
# ----------------------------------------------
alias gps='git push'
alias gpso='git push origin'
alias gpsoh='git push origin HEAD'
alias gpsu='git push -u origin HEAD'
alias gpsf='git push --force-with-lease'
alias gpsfoh='git push --force-with-lease origin HEAD'

# ----------------------------------------------
# マージ
# ----------------------------------------------
alias gm='git merge'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gmff='git merge --ff-only'

# ----------------------------------------------
# リベース
# ----------------------------------------------
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'
alias grbm='git rebase main || git rebase master'

# ----------------------------------------------
# リセット
# ----------------------------------------------
alias grs='git reset'
alias grsh='git reset --hard'
alias grss='git reset --soft'
alias grss1='git reset --soft HEAD~1'
alias grss2='git reset --soft HEAD~2'
alias grsh1='git reset --hard HEAD~1'
alias grsh2='git reset --hard HEAD~2'

# ----------------------------------------------
# スタッシュ
# ----------------------------------------------
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show -p'
alias gstu='git stash -u'  # 未追跡ファイルも含む

# ----------------------------------------------
# その他の便利コマンド
# ----------------------------------------------
alias gcl='git clean -fd'
alias gcp='git cherry-pick'
alias grv='git remote -v'
alias gtag='git tag'
alias gshow='git show'
alias gblame='git blame'

# 最新のタグを取得
alias glt='git describe --tags --abbrev=0'

# ワークツリーの状態を確認
alias gwt='git worktree'
alias gwtl='git worktree list'

# サブモジュール
alias gsu='git submodule update --init --recursive'

# ----------------------------------------------
# GitHub CLI (gh) エイリアス
# ----------------------------------------------
alias ghpr='gh pr create'
alias ghprl='gh pr list'
alias ghprv='gh pr view'
alias ghprc='gh pr checkout'
alias ghis='gh issue create'
alias ghisl='gh issue list'
alias ghisv='gh issue view'