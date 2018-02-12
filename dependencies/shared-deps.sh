#!/usr/bin/env bash

set -o errexit
set -o pipefail

print_and_return () {
  echo "$2"
  return $1
}

function_absent? () {
  ! [ -n "$(type -t $1)" ] && [ "$(type -t $1)" = function ] || print_and_return $? "Function $1 found. Skipping."
}

file_absent? () {
  ! [ -f "$1" ] || print_and_return $? "File $1 found. Skipping."
}

# nvm
function_absent? nvm && curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

# rvm
function_absent? rvm && curl -sSL https://get.rvm.io | bash -s stable

# vim-plug
file_absent? "$HOME/.vim/autoload/plug.vim" && curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

exit 0
