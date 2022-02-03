sudo apt install -y tmux fonts-firacode
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s ~/dotfiles/tmux.conf.local ~/.tmux.conf.local


echo "export LPASS_AGENT_TIMEOUT=86400" >> ~/.zshrc

echo "alias gb='git branch --sort=-committerdate'" >> ~/.zshrc
