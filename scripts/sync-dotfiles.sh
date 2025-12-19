#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"
HOME_DIR="$DOTFILES_DIR/home"

function doIt() {
	cd "$HOME_DIR" || exit
	
	if shellcheck --exclude=SC2139,SC1090,SC2164 .functions .aliases ../scripts/sync-dotfiles.sh; then
		echo "Shellcheck: ok!"

		rsync -avh --no-perms \
			.aliases \
			.editorconfig \
			.functions \
			.gitconfig \
			.macos \
			.prettierrc \
			.vimrc \
			.zshrc \
			~/;
	else
		echo "Shellcheck: failed!"
	fi;
}

if [ "$1" == "--force" ] || [ "$1" == "-f" ]; then
	doIt;
else
	read -rp "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
