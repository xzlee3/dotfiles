#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"

TARGET_DIR="$HOME/.config/nvim"
mkdir -p "$TARGET_DIR"

source="$(realpath "../nvim/init.lua")"
target="$TARGET_DIR/init.lua"

if [ -L "$target" ] && [ "$(realpath "$target")" = "$source" ]; then
	echo "Skipping init.lua (already linked)"
else
	if [ -e "$target" ] || [ -L "$target" ]; then
		backup="$target.backup"
		echo "Backing up init.lua to init.lua.backup"
		mv "$target" "$backup"
	fi

	ln -s "$source" "$target"
	echo "Linked init.lua"
fi

# Link lsp directory
source="$(realpath "../nvim/lsp")"
target="$TARGET_DIR/lsp"

if [ -L "$target" ] && [ "$(realpath "$target")" = "$source" ]; then
	echo "Skipping lsp/ (already linked)"
else
	if [ -e "$target" ] || [ -L "$target" ]; then
		backup="$target.backup"
		echo "Backing up lsp/ to lsp.backup"
		mv "$target" "$backup"
	fi

	ln -s "$source" "$target"
	echo "Linked lsp/"
fi
