sudo apt install -y tmux fonts-firacode

cd $HOME
git clone https://github.com/gpakosz/.tmux.git
ln -s $HOME/dotfiles/tmux.conf.local $HOME/.tmux.conf.local

echo "alias gb='git branch --sort=-committerdate'" >> ~/.zshrc
