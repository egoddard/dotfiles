echo "bindkey -v" >>~/.zshrc
echo "set -o vi" >>~/.bashrc

echo "alias gb='git branch --sort=-committerdate'" >>~/.zshrc
echo "alias gb='git branch --sort=-committerdate'" >>~/.bashrc
echo "alias tree='tree --dirsfirst -I __pycache__ -I node_modules'" >>~/.zshrc

echo "export STARSHIP_CONFIG=$HOME/dotfiles/starship.toml" >>~/.zshrc
echo "export STARSHIP_CONFIG=$HOME/dotfiles/starship.toml" >>~/.bashrc

sudo unlink /etc/localtime
sudo ln -s /usr/share/zoneinfo/America/Chicago /etc/localtime

ARCH="$(uname -m)"
OP_VERSION="v$(curl https://app-updates.agilebits.com/check/1/0/CLI2/en/2.0.0/N -s | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+')"
curl -sSfo op.zip \
    https://cache.agilebits.com/dist/1P/op2/pkg/"$OP_VERSION"/op_linux_"$ARCH"_"$OP_VERSION".zip &&
    unzip -od /usr/local/bin/ op.zip &&
    rm op.zip
