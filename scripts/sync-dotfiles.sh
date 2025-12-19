#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"

function doIt() {
	cd "$DOTFILES_DIR"
	
	if shellcheck --exclude=SC2139,SC1090 .functions .aliases scripts/sync-dotfiles.sh; then
		echo "Shellcheck: ok!"

		rsync -avh --no-perms \
			.aliases \
			.oh-my-zsh-aliases \
			.editorconfig \
			.functions \
			.gitconfig \
			.gitignore \
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
