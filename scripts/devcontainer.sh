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
