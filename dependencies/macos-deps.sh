#!/usr/bin/env bash

set -euo pipefail

print_and_return () {
  echo "$2"
  return $1
}

tapped? () {
  ! brew tap | grep "$1" > /dev/null || print_and_return $? "Tap $1 is already tapped. Skipping."
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

file_absent? () {
  ! [ -f "$1" ] || print_and_return $? "File $1 found. Skipping."
}

# Homebrew
command_absent? brew && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# osx-cross
tapped? osx-cross/avr && brew tap osx-cross/avr

# lsusb
tapped? jlhonora/lsusb && brew tap jlhonora/lsusb

# fonts
tapped? homebrew/cask-fonts && brew tap homebrew/cask-fonts

# zsh-history-substring-search
file_absent? /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh && brew install zsh-history-substring-search

# fzf - fuzzy search
command_absent? fzf && brew install fzf

# youtube-dl
command_absent? youtube-dl && brew install youtube-dl

# java
command_absent? java && brew install java

# hub - github cli interface
command_absent? hub && brew install hub

# bfg - fast git repo cleaner
command_absent? bfg && brew install bfg

# mas - cli for Mac App Store
command_absent? mas && brew install mas

# exa
command_absent? exa && brew install exa

# rg
command_absent? rg && brew install ripgrep

# htop
command_absent? htop && brew install htop

# nmap
command_absent? nmap && brew install nmap

# cowsay
command_absent? cowsay && brew install cowsay

# avr-gcc
command_absent? avr-gcc && brew install avr-gcc

# lsusb
command_absent? lsusb && brew install lsusb

# iTerm
application_absent? iTerm && brew install iterm2

# docker
application_absent? Docker && brew install --cask docker

# Syncthing
application_absent? Syncthing && brew install --cask syncthing

# Keka
application_absent? Keka && brew install keka

# Launch Control
application_absent? LaunchControl && brew install launchcontrol

# Firefox
application_absent? Firefox && brew install firefox

# Google Chrome
application_absent? "Google Chrome" && brew install google-chrome

# UninstallPKG
application_absent? UninstallPKG && brew install uninstallpkg

# Alfred
application_absent? "Alfred 5" && brew install alfred

# Sublime Text
application_absent? "Sublime Text" && brew install sublime-text

# Visual Studio Code
application_absent? "Visual Studio Code" && brew install visual-studio-code

# Textual
application_absent? Textual && brew install textual

# Paw
application_absent? Paw && brew install paw

# Dash
application_absent? Dash && brew install --cask dash

# Trailer
application_absent? Trailer && brew install trailer

# Messenger (Facebook)
application_absent? Messenger && brew install messenger

# WhatsApp
application_absent? WhatsApp && brew install whatsapp

# Signal
application_absent? Signal && brew install signal

# Spotify
application_absent? Spotify && brew install spotify

# iStat Menus
application_absent? "iStat Menus" && brew install istat-menus

# kicad
#application_absent? Kicad/kicad && brew install kicad

# Bonjeff
application_absent? Bonjeff && brew install bonjeff

# 1Password
application_absent? "1Password" && brew install 1password

# Transmit
application_absent? Transmit && brew install transmit

# DaisyDisk
application_absent? DaisyDisk && brew install daisydisk

# Xcode
application_absent? Xcode && mas install 497799835

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
font_absent? FiraCode-Regular.otf && brew install font-fira-code

# Nerd Font
font_absent? "Fira Code Regular Nerd Font Complete.otf" && brew install font-firacode-nerd-font

# Brew Cleanup
brew cleanup

exit 0
