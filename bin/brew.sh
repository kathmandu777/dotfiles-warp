#!/bin/zsh

# Check operating system
if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

function open_app_store {
  echo "Please login with your Apple ID"
  sleep 1; echo "Open the App Store."
  sleep 1; open -a App\ Store
}

function login_check {
  while true; do
    echo -n "$* [Y/n]: (default: n) "
    read ANS
    case $ANS in
      [Yy]*)
        return 0
        ;;
      *)
        open_app_store
        ;;
    esac
  done
}

open_app_store
if login_check "Did you login?"; then
  brew bundle --global
fi