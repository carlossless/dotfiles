#!/usr/bin/env bash

set -o errexit
set -o pipefail

print_and_return () {
  echo "$2"
  return $1
}

command_absent? () {
  ! [ -x "$(command -v $1)" ] || print_and_return $? "Command $1 found. Skipping."
}

application_absent? () {
  ! [ -d "/Applications/$1.app" ] || print_and_return $? "Application $1 found. Skipping."
}

# Homebrew
command_absent? brew && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# youtube-dl
command_absent? youtube-dl && brew install youtube-dl

# hub
command_absent? hub && brew install hub

# Launch Control
application_absent? LaunchControl && brew cask install LaunchControl

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Fire Code
brew tap caskroom/fonts && brew cask install font-fira-code

return 0
