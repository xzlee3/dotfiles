#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"

echo "Setting up dotfiles..."

# Fish shell
echo "> Setup fish shell..."
scripts/setup-fish.sh

# Neovim
echo "> Setup Neovim..."
scripts/setup-neovim.sh

echo "Done!"
