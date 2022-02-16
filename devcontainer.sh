echo "bindkey -v" >> ~/.zshrc
echo "set -o vi" >> ~/.bashrc

echo "alias gb='git branch --sort=-committerdate'" >> ~/.zshrc
echo "alias gb='git branch --sort=-committerdate'" >> ~/.bashrc

echo "export STARSHIP_CONFIG=$HOME/dotfiles/starship.toml" >> ~/.zshrc
echo "export STARSHIP_CONFIG=$HOME/dotfiles/starship.toml" >> ~/.bashrc

sudo unlink /etc/localtime
sudo ln -s /usr/share/zoneinfo/America/Chicago /etc/localtime
