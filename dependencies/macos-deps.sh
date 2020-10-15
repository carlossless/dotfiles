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
command_absent? brew && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

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
command_absent? java && brew cask install java

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

# xquartz
application_absent? "Utilities/XQuartz" && brew cask install xquartz

# Knot Resolver
command_absent? kdig && brew install knot-resolver

# iTerm
application_absent? iTerm && brew cask install iterm2

# docker
application_absent? Docker && brew cask install docker

# Dropox
application_absent? Dropbox && brew cask install dropbox

# Syncthing
application_absent? Syncthing && brew cask install syncthing

# Keka
application_absent? Keka && brew cask install keka

# Launch Control
application_absent? LaunchControl && brew cask install launchcontrol

# Firefox
application_absent? Firefox && brew cask install firefox

# Google Chrome
application_absent? "Google Chrome" && brew cask install google-chrome

# UninstallPKG
application_absent? UninstallPKG && brew cask install uninstallpkg

# Alfred
application_absent? "Alfred 4" && brew cask install alfred

# Sublime Text
application_absent? "Sublime Text" && brew cask install sublime-text

# Visual Studio Code
application_absent? "Visual Studio Code" && brew cask install visual-studio-code

# Sketch
application_absent? Sketch && brew cask install sketch

# Skype
application_absent? Skype && brew cask install skype

# Textual
application_absent? Textual && brew cask install textual

# Beamer
application_absent? Beamer && brew cask install beamer

# Paw
application_absent? Paw && brew cask install paw

# Dash
application_absent? Dash && brew cask install dash

# Trailer
application_absent? Trailer && brew cask install trailer

# Messenger (Facebook)
application_absent? Messenger && brew cask install messenger

# WhatsApp
application_absent? WhatsApp && brew cask install whatsapp

# Spotify
application_absent? Spotify && brew cask install spotify

# Tunnelblick
application_absent? Tunnelblick && brew cask install tunnelblick

# iStat Menus
application_absent? "iStat Menus" && brew cask install istat-menus

# kicad
application_absent? Kicad/kicad && brew cask install kicad

# Bonjeff
application_absent? Bonjeff && brew cask install bonjeff

# 1Password
application_absent? "1Password 7" && brew cask install 1password

# Transmit
application_absent? Transmit && brew cask install transmit

# VMware Fussion
application_absent? "VMware Fusion" && brew cask install vmware-fusion

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

# Wireguard
application_absent? Wireguard && mas install 1451685025

# Fira Code
font_absent? FiraCode-Regular.otf && brew cask install font-fira-code

# Nerd Font
font_absent? "Fira Code Regular Nerd Font Complete.otf" && brew cask install font-firacode-nerd-font

# Brew Cleanup
brew cleanup

exit 0
