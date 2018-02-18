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

# hub - github cli interface
command_absent? hub && brew install hub

# bfg - fast git repo cleaner
command_absent? bfg && brew install bfg

# mas - cli for Mac App Store
command_absent? mas && brew install mas

# htop
command_absent? htop && brew install htop

# docker
application_absent? Docker && brew cask install docker

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

# Textual
application_absent? Textual && brew cask install textual

# Messenger (Facebook)
application_absent? Messenger && brew cask install messenger

# WhatsApp
application_absent? WhatsApp && brew cask install whatsapp

# Spotify
application_absent? Spotify && brew cask install spotify

# Tunnelblick
application_absent? Tunnelblick && brew cask install tunnelblick

# kicad
application_absent? Kicad/kicad && brew cask install kicad

# Bonjeff
application_absent? Bonjeff && brew cask install bonjeff

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

# Fira Code
font_absent? FiraCode-Regular.otf && brew tap caskroom/fonts && brew cask install font-fira-code

exit 0

