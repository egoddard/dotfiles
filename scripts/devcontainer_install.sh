#!/bin/bash

if test -f "${HOME}/.dotfiles_installed"; then
	echo "Install script has already run, exiting"
	exit 0
fi

if [ "$UID" -eq 0 ]; then
	source $HOME/dotfiles/scripts/devcontainer_nvim_root.sh
else
	source $HOME/dotfiles/scripts/devcontainer_nvim.sh
fi
