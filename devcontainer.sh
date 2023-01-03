echo "bindkey -v" >> ~/.zshrc
echo "alias gb='git branch --sort=-committerdate'" >> ~/.zshrc
echo "export STARSHIP_CONFIG=$HOME/dotfiles/starship.toml" >> ~/.zshrc

sudo unlink /etc/localtime
sudo ln -s /usr/share/zoneinfo/America/Chicago /etc/localtime

curl -sSfo op.zip \
  https://cache.agilebits.com/dist/1P/op2/pkg/v2.12.0/op_linux_arm64_v2.12.0.zip \
  && sudo unzip -od /usr/local/bin/ op.zip \
  && rm op.zip
