#!/bin/bash

if test -f "${HOME}/.dotfiles_installed"; then
	echo "Install script has already run, exiting"
	exit 0
fi

if arch | grep -q "aarch64"; then
	ARCH='arm64'
else
	ARCH='x86_64'
fi

apt update && apt install -y ninja-build gettext cmake unzip curl build-essential tmux stow ripgrep fzf
apt remove -y neovim

cd
git clone https://github.com/neovim/neovim && cd neovim && git checkout v0.9.5
make CMAKE_BUILD_TYPE=Release
make install

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

nvm install --lts

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "bindkey -v" >>~/.zshrc
echo "set -o vi" >>~/.bashrc

echo "alias gb='git branch --sort=-committerdate'" >>~/.zshrc
echo "alias gb='git branch --sort=-committerdate'" >>~/.bashrc
echo "alias tree='tree --dirsfirst -I __pycache__ -I node_modules'" >>~/.zshrc

unlink /etc/localtime
ln -s /usr/share/zoneinfo/America/Chicago /etc/localtime

curl -sSfo op.zip \
	https://cache.agilebits.com/dist/1P/op2/pkg/v2.27.0/op_linux_arm64_v2.27.0.zip &&
	unzip -od /usr/local/bin/ op.zip &&
	rm op.zip

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_${ARCH}.tar.gz"
tar xf lazygit.tar.gz lazygit
install lazygit /usr/local/bin

cd ~/dotfiles
stow kickstart.nvim tmux starship

# Write file to home dir that we can check at next startup to see if this script needs to run
touch ~/.dotfiles_installed

