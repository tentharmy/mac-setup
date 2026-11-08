#!/bin/sh
set -eu

cd "$(dirname "$0")"

target="$HOME/.gitconfig"
source_file="$PWD/dotfiles/gitconfig"

if [ -L "$target" ] && [ "$(readlink "$target")" = "$source_file" ]; then
    echo "Git configuration already installed"
elif [ -e "$target" ] || [ -L "$target" ]; then
    echo "Existing Git configuration found: $target" >&2
    exit 1
else
    ln -s "$source_file" "$target"
    echo "Git configuration installed"
fi
