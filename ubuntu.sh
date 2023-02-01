#!/usr/bin/env bash

# Manual steps
# 5. Create a pynvim virtualenv and install pynvim. Set the path in init.vim:

	# let g:python3_host_prog='$HOME/.envs/neovim3/Scripts/python'
	# let g:python_host_prog='$HOME/.envs/neovim/Scripts/python'

PYTHON_VERSION="3.9.16"

# Install dev libs and tools
sudo apt install -y \
  build-essential \
  libnss3 \
  wget \
  curl \
  make \
  libssl-dev \
  zlib1g-dev \
  libreadline-dev \
  libbz2-dev \
  libsqlite3-dev \
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
  tmux \
  apt-transport-https \
  ca-certificates \
  gnupg2 \
  fontconfig \
  libsnappy1v5 \
  libsnappy-dev \
  docker.io \
  libpq-dev \
  postgresql-client \
  zsh

# Add neovim ppa for a recent version -- not necessary on ubuntu 19.10
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt update && sudo apt install -y neovim

chsh -s /usr/bin/zsh
touch $HOME/.zshrc

#sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
#sudo update-alternatives --config vi
#sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
#sudo update-alternatives --config vim
#sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
#sudo update-alternatives --config editor

# Set up oh my bash
# sh -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"

# Set up oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# Set up oh my tmux
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
ln -s $HOME/dotfiles/tmux.conf.local $HOME/.tmux.conf.local


# install custom fonts 
wget 'https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/complete/Fura%20Code%20Regular%20Nerd%20Font%20Complete%20Mono.otf'
mkdir -p $HOME/.local/share/fonts
mv 'Fura Code Regular Nerd Font Complete Mono.otf' $HOME/.local/share/fonts/
fc-cache -vf $HOME/.local/share/fonts


# Install pyenv
git clone https://github.com/pyenv/pyenv.git $HOME/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile
echo 'eval "$(pyenv init -)"' >> ~/.profile


echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zprofile
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zprofile
echo 'eval "$(pyenv init -)"' >> ~/.zprofile

# Install tfenv
git clone --depth=1 https://github.com/tfutils/tfenv.git $HOME/.tfenv


# Instal nvm and node + npm
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  ) && \. "$NVM_DIR/nvm.sh"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`

echo 'export NVM_DIR="$HOME/.nvm"' >> $HOME/.bashrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> $HOME/.bashrc # This loads nvm
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> $HOME/.bashrc #This loads nvm bash completion

echo 'export NVM_DIR="$HOME/.nvm"' >> $HOME/.profile
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> $HOME/.profile # This loads nvm
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> $HOME/.profile #This loads nvm bash completion


echo 'export NVM_DIR="$HOME/.nvm"' >> $HOME/.zshrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> $HOME/.zshrc # This loads nvm
echo '[ -s "$NVM_DIR/zsh_completion" ] && \. "$NVM_DIR/zsh_completion"' >> $HOME/.zshrc #This loads nvm zsh completion

echo 'export NVM_DIR="$HOME/.nvm"' >> $HOME/.zprofile
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> $HOME/.zprofile # This loads nvm
echo '[ -s "$NVM_DIR/zsh_completion" ] && \. "$NVM_DIR/zsh_completion"' >> $HOME/.zprofile #This loads nvm zsh completion

mkdir -p $HOME/.local/bin
# Create $HOME/.local/bin and update paths
echo 'export PATH="$HOME/.local/bin:$PYENV_ROOT/bin:$HOME/.tfenv/bin:$PATH"' >> ~/.bashrc


# Set XDG_CONFIG_HOME env var
echo 'export XDG_CONFIG_HOME="$HOME/.config"' >> $HOME/.zshrc
echo 'export XDG_CONFIG_HOME="$HOME/.config"' >> $HOME/.bashrc



# Symlink nvim config
mkdir -p $XDG_CONFIG_HOME/nvim
#ln -s $HOME/dotfiles/init.vim $XDG_CONFIG_HOME/nvim/init.vim


# Install $PYTHON_VERSION with pyenv and set it as the global python
pyenv install $PYTHON_VERSION
pyenv global $PYTHON_VERSION


# Allow your user to access the Docker CLI without needing root access.
sudo usermod -aG docker $USER

# Install python packages using the global pyenv python
pip install --upgrade pip
pip install docker-compose pipenv 


# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

mkdir $XDG_CONFIG_HOME/alacritty
git clone https://github.com/catppuccin/alacritty.git $XDG_CONFIG_HOME/alacritty/catppuccin


# Install starship.rs terminal
curl -sS https://starship.rs/install.sh | sh
echo 'export STARSHIP_CONFIG=$HOME/dotfiles/starship.toml' >> $HOME/.zshrc
echo 'eval "$(starship init zsh)"' >> $HOME/.zshrc

echo 'export STARSHIP_CONFIG=$HOME/dotfiles/starship.toml' >> $HOME/.bashrc
echo 'eval "$(starship init bash)"' >> $HOME/.bashrc

# Add direnv hooks
echo 'eval "$(direnv hook bash)"' >> $HOME/.bashrc
echo 'eval "$(direnv hook zsh)"' >> $HOME/.zshrc
