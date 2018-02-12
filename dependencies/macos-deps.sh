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

font_absent? () {
  ! [ -f "/Library/Fonts/$1" ] && ! [ -f "$HOME/Library/Fonts/$1" ] || print_and_return $? "Font $1 found. Skipping."
}

# Homebrew
command_absent? brew && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# youtube-dl
command_absent? youtube-dl && brew install youtube-dl

# java
command_absent? java && brew cask install java

# hub
command_absent? hub && brew install hub

# bfg
command_absent? bfg && brew install bfg

# mas
command_absent? mas && brew install mas

# Launch Control
application_absent? LaunchControl && brew cask install launchcontrol

# UninstallPKG
application_absent? UninstallPKG && brew cask install uninstallpkg

# Alfred
application_absent? "Alfred 3" && brew cask install alfred

# Sublime Text
application_absent? "Sublime Text" && brew cask install sublime-text

# Sketch
application_absent? Sketch && brew cask install sketch

# Skype
application_absent? Skype && brew cask install skype

# IRCCloud
application_absent? IRCCloud && brew cask install irccloud

# Tunnelblick
application_absent? Tunnelblick && brew cask install tunnelblick

# Fira Code
font_absent? FiraCode-Regular.otf && brew tap caskroom/fonts && brew cask install font-fira-code

# 1Password
application_absent? 1Password && mas install 443987910

# Xcode
application_absent? Xcode && mas install 497799835

# DaisyDisk
application_absent? DaisyDisk && mas install 411643860

# Tweetbot
application_absent? Tweetbot && mas install 557168941

# Things
application_absent? Things3 && mas install 904280696

# Deckset
application_absent? Deckset && mas install 847496013

# Deliveries
application_absent? Deliveries && mas install 924726344

# Slack
application_absent? Slack && mas install 803453959

exit 0

