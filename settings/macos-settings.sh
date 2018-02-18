#!/usr/bin/env bash

set -o errexit
set -o pipefail

# Finder Settings
# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show full path in finder window titles
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Autocorrect
defaults write -g NSAutomaticCapitalizationEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Autohide dock
defaults write com.apple.dock autohide -bool true

# Siri
defaults write com.apple.Siri StatusMenuVisible -bool false

# Gatekeeper
sudo spctl --master-disable

# Sublime Text Key Repeat (for vi mode)
defaults write com.sublimetext.3 ApplePressAndHoldEnabled -bool false

# Restart Finder
killall Finder

# Restart Dock
killall Dock

exit 0
