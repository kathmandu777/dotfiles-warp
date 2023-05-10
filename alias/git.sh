
# git
alias g='git'

# status
alias gs='git status'

# log
alias gl='git log'

# add
alias ga='git add'

# branch
alias gb='git branch'

# checkout
alias gc='git checkout'

# commit
alias gct='git commit'
alias gcm='git commit -m'

# diff
alias gd='git diff'

# fetch
alias gfo='git fetch origin'
#__git_complete gfe _git_fetch

# merge
alias gm='git merge'

# push
alias gps='git push'
alias gpso='git push origin'
alias gpsoh='git push origin HEAD'
alias gpsfoh='git push -f origin HEAD'
alias gpsfloh='git push --force-with-lease origin HEAD'

# pull
alias gpl='git pull'
alias gplf='git fetch;git reset --hard origin/$(git symbolic-ref --short HEAD)'

# stash
alias gst='git stash'
alias gsl='git stash list'
alias gsa='git stash apply'
alias gsp='git stash pop'
alias gssu='git stash save -u'

# rebase
alias grb='git rebase'

# reset
alias grs='git reset'
alias grss1='git reset --soft HEAD~1'
alias grss2='git reset --soft HEAD~2'
alias grss3='git reset --soft HEAD~3'
alias grss4='git reset --soft HEAD~4'
alias grsh1='git reset --hard HEAD~1'
alias grsh2='git reset --hard HEAD~2'

# remove branch merged except main, master, develop
alias gbrm="git branch --merged|egrep -v '\*|main|master|develop|dev|release'|xargs git branch -d"
