echo "bindkey -v" >> ~/.zshrc
echo "alias gb='git branch --sort=-committerdate'" >> ~/.zshrc
echo "export STARSHIP_CONFIG=$HOME/dotfiles/starship.toml" >> ~/.zshrc

sudo unlink /etc/localtime
sudo ln -s /usr/share/zoneinfo/America/Chicago /etc/localtime
