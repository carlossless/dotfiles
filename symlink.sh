#!/usr/bin/env bash

set -o errexit
set -o pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

delete_file () {
  printf "Deleting $1\n"
  rm "$1"
}

check_and_delete () {
  if [ -f "$1" ] || [ -L "$1" ]; then
    printf "\n$1 already exists.\n"
    read -p "Do you want to delete it? (y/N): " confirmation
    case "$confirmation" in
      [yY] | [yY][eE][sS]) delete_file "$1"; return 0 ;;
      *) printf "Skipped $1\n"; return 1 ;;
    esac
  fi
  return 0
}

symlink_file() {
  printf "Symlinking "$2" to "$1"\n"
  ln -s "$1" "$2"
}

try_symlink () {
  check_and_delete "$2" && symlink_file "$SCRIPT_DIR/$1" "$2" || return 0
}

try_home_symlink () {
  if [ -z "$2" ]; then
    try_symlink "$1" "$HOME/$1"
  else
    try_symlink "$1" "$HOME/$2"
  fi
}

printf "Bootstrapping dotfiles\n\n"

try_home_symlink ".zshrc"
try_home_symlink ".gitconfig"
try_home_symlink ".gitignore_global"
try_home_symlink ".ssh/config"
try_home_symlink "editors/.vimrc" ".vimrc"

if [[ $(uname) == "Darwin" ]]; then
  # vscode
  if [ -d "$HOME/Library/Application Support/Code" ]; then
    try_home_symlink "editors/vscode/settings.json" "Library/Application Support/Code/User/settings.json"
    try_home_symlink "editors/vscode/keybindings.json" "Library/Application Support/Code/User/keybindings.json"
  else
    printf "Skipping vscode settings, '$HOME/Library/Application Support/Code' not found\n"
  fi

  # sublime text
  if [ -d "$HOME/Library/Application Support/Sublime Text 3" ]; then
    try_home_symlink "editors/sublime/Preferences.sublime-settings" "Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
    try_home_symlink "editors/sublime/Default (OSX).sublime-keymap" "Library/Application Support/Sublime Text 3/Packages/User/Default (OSX).sublime-keymap"
  else
    printf "Skipping sublime settings, '$HOME/Library/Application Support/Sublime Text 3' not found\n"
  fi
fi
