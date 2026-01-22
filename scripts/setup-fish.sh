#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"

TARGET_DIR="$HOME/.config/fish"
mkdir -p "$TARGET_DIR"

for i in ../fish/*; do
	name=$(basename "$i")
	source="$(realpath "$i")"
	target="$TARGET_DIR/$name"

	if [ -L "$target" ]; then
		# Target is a symlink - check if it points to the right place
		current=$(realpath "$target")
		if [ "$current" = "$source" ]; then
			echo "Skipping $name (already linked)"
			continue
		fi
	fi

	if [ -e "$target" ] || [ -L "$target" ]; then
		backup="$target.backup"
		echo "Backing up $name to $name.backup"
		mv "$target" "$backup"
	fi

	ln -s "$source" "$target"
	echo "Linked $name"
done
