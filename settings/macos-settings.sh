#!/usr/bin/env bash

set -o errexit
set -o pipefail

# Finder Settings
# Show hidden files
defaults write com.apple.finder AppleShowAllFiles TRUE

# Show full path in finder window titles
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Autocorrect
defaults write -g NSAutomaticCapitalizationEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Gatekeeper
sudo spctl --master-disable

# Restart Finder
killall Finder

exit 0
