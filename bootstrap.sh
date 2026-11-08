#!/bin/sh
set -eu

cd "$(dirname "$0")"

link_file() {
    source_file="$PWD/$1"
    target="$HOME/$2"

    if [ -L "$target" ] && [ "$(readlink "$target")" = "$source_file" ]; then
        echo "Already installed: $target"
    elif [ -e "$target" ] || [ -L "$target" ]; then
        echo "Existing file found: $target" >&2
        exit 1
    else
        ln -s "$source_file" "$target"
        echo "Installed: $target"
    fi
}

# Git
link_file "dotfiles/gitconfig" ".gitconfig"

# SSH
mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"
chmod 600 dotfiles/ssh/config
link_file "dotfiles/ssh/config" ".ssh/config"

# 1Password SSH Agent
mkdir -p "$HOME/.config/1Password/ssh"
link_file \
    "dotfiles/1password/agent.toml" \
    ".config/1Password/ssh/agent.toml"