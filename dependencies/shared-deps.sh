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

# nvm
function_absent? nvm && curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

# rvm
function_absent? rvm && curl -sSL https://get.rvm.io | bash -s stable

return 0