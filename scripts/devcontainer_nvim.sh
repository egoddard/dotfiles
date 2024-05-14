#!/bin/bash

sudo apt update && sudo apt install -y ninja-build gettext cmake unzip curl build-essential tmux stow ripgrep fzf
sudo apt remove -y neovim

cd
git clone https://github.com/neovim/neovim && cd neovim && git checkout stable
make CMAKE_BUILD_TYPE=Release

sudo make install
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb

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

echo "export STARSHIP_CONFIG=$HOME/dotfiles/starship.toml" >>~/.zshrc
echo "export STARSHIP_CONFIG=$HOME/dotfiles/starship.toml" >>~/.bashrc

sudo unlink /etc/localtime
sudo ln -s /usr/share/zoneinfo/America/Chicago /etc/localtime

curl -sSfo op.zip \
	https://cache.agilebits.com/dist/1P/op2/pkg/v2.27.0/op_linux_arm64_v2.27.0.zip &&
	sudo unzip -od /usr/local/bin/ op.zip &&
	rm op.zip

cd ~/dotfiles
stow nvim tmux
