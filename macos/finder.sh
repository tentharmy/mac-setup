#!/bin/sh
set -eu

# Always show filename extensions.
# Reason: file types should be explicit.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Always show hidden files.
# Reason: development files should be visible.
defaults write com.apple.finder AppleShowAllFiles -bool true

# Reload Finder to apply changes.
killall Finder
