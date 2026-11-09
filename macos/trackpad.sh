#!/bin/sh
set -eu

# Content follows finger movement.
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

printf '✓ Trackpad configured\n'
