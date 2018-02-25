#!/usr/bin/env bash

set -o errexit
set -o pipefail

print_and_return () {
  echo "$2"
  return $1
}

directory_absent? () {
  ! [ -d "$1" ] || print_and_return $? "Directory $1 found. Skipping."
}

file_absent? () {
  ! [ -f "$1" ] || print_and_return $? "File $1 found. Skipping."
}

# nvm
directory_absent? "$HOME/.nvm" && curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

# rvm
directory_absent? "$HOME/.rvm" && curl -sSL https://get.rvm.io | bash -s stable

# rustup
directory_absent? "$HOME/.cargo/bin" && curl https://sh.rustup.rs -sSf | sh

# vim-plug
file_absent? "$HOME/.vim/autoload/plug.vim" && curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && vim +PlugInstall +qall

# dokku-client
directory_absent? "$HOME/.dokku" && git clone git@github.com:dokku/dokku.git "$HOME/.dokku"

exit 0
