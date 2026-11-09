#!/bin/sh
set -eu

# Keep Dock hidden until explicitly needed.
defaults write com.apple.dock autohide -bool true

# Minimize windows into their application icons.
defaults write com.apple.dock minimize-to-application -bool true

# Disable icon magnification.
defaults write com.apple.dock magnification -bool false

# Show only running applications, not recent ones.
defaults write com.apple.dock show-recents -bool false

# Disable application launch animation.
defaults write com.apple.dock launchanim -bool false

# Hide running application indicators.
defaults write com.apple.dock show-process-indicators -bool false

# Use the Scale effect when minimizing windows.
defaults write com.apple.dock mineffect -string scale

# Remove all pinned applications.
defaults write com.apple.dock persistent-apps -array

# Apply changes.
killall Dock

printf '✓ Dock configured\n'
