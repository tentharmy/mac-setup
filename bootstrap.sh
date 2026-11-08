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

# Homebrew installation
if [ ! -x /opt/homebrew/bin/brew ]; then
    echo "Installing Homebrew..."

    /bin/bash -c "$(
        curl -fsSL \
        https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
    )"
fi

# Make Homebrew available to this process
eval "$(/opt/homebrew/bin/brew shellenv)"

# Homebrew packages
if command -v brew >/dev/null 2>&1; then
    brew bundle --file="$PWD/Brewfile"
else
    echo "Homebrew is not installed" >&2
    exit 1
fi

# Configure zprofile
link_file "dotfiles/zprofile" ".zprofile"

# Configure zshrc
link_file "dotfiles/zshrc" ".zshrc"

# macOS preferences
sh "$PWD/macos/finder.sh"
