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
    printf "$1 already exists.\n"
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
  check_and_delete "$HOME/$1" && symlink_file "$SCRIPT_DIR/$1" "$HOME/$1"
  printf "\n"
}

printf "Bootstrapping dotfiles\n\n"

try_symlink ".zshrc"
try_symlink ".vimrc"
try_symlink ".gitconfig"
try_symlink ".gitignore_global"
try_symlink ".ssh/config"
