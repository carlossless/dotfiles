#!/usr/bin/env bash

set -o errexit
set -o pipefail

# Finder Settings
# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show full path in finder window titles
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Show Status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Use current directory as default search scope
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Autocorrect
defaults write -g NSAutomaticCapitalizationEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Key Repeat Rates
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2

# Autohide dock
defaults write com.apple.dock autohide -bool true

# Siri
defaults write com.apple.Siri StatusMenuVisible -bool false

# Text Editor Key Repeat
defaults write com.sublimetext.3 ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write md.obsidian ApplePressAndHoldEnabled -bool false

# AirDrop over Ethernet 
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# No .DS_Store files on network stores and usb drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Gatekeeper
sudo spctl --master-disable

# Restart Finder
killall Finder

# Restart Dock
killall Dock

exit 0
