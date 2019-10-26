#!/bin/bash

EXTRATERM_VERSION = "0.42.1"
EXTRATERM_FILE = "extraterm-$EXTRA_TERM_VERSION-linux-x64"
EXTRATERM_COMMANDS_FILE = "extraterm-commands-$EXTRA_TERM_VERSION"

echo "deb https://deb.debian.org/debian stretch-backports main" >> /etc/apt/sources.list

sudo apt update && sudo apt-get -y -t stretch-backports tmux

# install Dev dependencies
sudo apt install -y \
  build-essential \
  libnss3 \
  wget \
  curl \
  make \
  libssl-dev \
  zlib1g-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  wget \
  curl \
  llvm \
  libncurses5-dev \
  xz-utils \
  tk-dev \
  libxml2-dev \
  libxmlsec1-dev \
  libffi-dev \
  liblzma-dev \
  jq \
  xclip \
  direnv \
  fuse

# Install extraterm
wget "https://github.com/sedwards2009/extraterm/releases/download/v$EXTRATERM_VERSION/$EXTRATERM_FILE.zip"
wget "https://github.com/sedwards2009/extraterm/releases/download/v$EXTRATERM_VERSION/$EXTRATERM_COMMANDS_FILE.zip"
unzip $("$EXTRATERM_FILE.zip")
unzip $("$EXTRATERM_COMMANDS_FILE.zip")

# Set up oh my bash
sh -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"

# Set up oh my tmux
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
ln -s ~/dotfiles/tmux.conf.local ~/.tmux.conf.local


# install custom fonts 
wget 'https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/complete/Fura%20Code%20Regular%20Nerd%20Font%20Complete%20Mono.otf'
mkdir -p ~/.local/share/fonts
mv 'Fura Code Regular Nerd Font Complete Mono.otf' ~/.local/share/fonts/
fc-cache -vf ~/.local/share/fonts

# Install pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc

# Install neovim
# pip3 install pynvim

# install docker
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable"

sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo groupadd docker
sudo usermod -aG docker $USER

