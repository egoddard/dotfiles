#!/usr/bin/env bash

# Manual steps
# 1. Enable/install WSL, and install Ubuntu
# 2. Install Docker Desktop
# 3. Install extraterm (extraterm.org) for a decent terminal
# 4. create an ssh key in windows. that key will be copied in to WSL
# 5. Create a pynvim virtualenv and install pynvim. Set the path in init.vim:

	# let g:python3_host_prog='$HOME/.envs/neovim3/Scripts/python'
	# let g:python_host_prog='$HOME/.envs/neovim/Scripts/python'

PYTHON_VERSION="3.7.5"

# Install dev libs and tools
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
  fuse \
  tmux \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg2 \
  software-properties-common \
  fontconfig \
  libsnappy1v5 \
  libsnappy-dev

# Add neovim ppa for a recent version
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt update && sudo apt install -y neovim

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

# Set up oh my bash
sh -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"

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
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> $HOME/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> $HOME/.bashrc

# Install tfenv
git clone https://github.com/tfutils/tfenv.git $HOME/.tfenv

# Create $HOME/.local/bin and update paths
mkdir -p $HOME/.local/bin
echo 'export PATH="$HOME/.local/bin:$PYENV_ROOT/bin:$HOME/.tfenv/bin:$PATH"' >> ~/.bashrc

# Install Hashicorp vault
wget https://releases.hashicorp.com/vault/1.2.3/vault_1.2.3_linux_amd64.zip -O vault.zip
unzip -d $HOME/.local/bin/ vault.zip
chmod +x $HOME/.local/bin/vault
rm vault.zip

# Install AWS Vault
wget https://github.com/99designs/aws-vault/releases/download/v4.6.4/aws-vault-linux-amd64 -O $HOME/.local/bin/aws-vault
chmod +x $HOME/.local/bin/aws-vault


# Set XDG_CONFIG_HOME env var
echo 'export XDG_CONFIG_HOME="$HOME/.config"' >> $HOME/.bashrc && source $HOME/.bashrc


# Install vim-plug for Neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# Symlink nvim config
mkdir -p $XDG_CONFIG_HOME/nvim
ln -s $HOME/dotfiles/init.vim $XDG_CONFIG_HOME/nvim/init.vim


# Install $PYTHON_VERSION with pyenv and set it as the global python
pyenv install $PYTHON_VERSION
pyenv global $PYTHON_VERSION


# Install Docker
# Download and add Docker's official public PGP key.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verify the fingerprint.
sudo apt-key fingerprint 0EBFCD88

# Add the `stable` channel's Docker upstream repository.
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update the apt package list (for the new apt repo).
sudo apt update -y

# Install the latest version of Docker CE.
sudo apt install -y docker-ce

# Allow your user to access the Docker CLI without needing root access.
sudo usermod -aG docker $USER

# Tell WSL docker to use the Docker Desktop (for Windows) daemon
echo "export DOCKER_HOST=tcp://localhost:2375" >> ~/.bashrc && source ~/.bashrc

# Install python packages using the global pyenv python
pip install --upgrade pip
pip install docker-compose pipenv

# Enable pipenv completion
echo 'eval "$(pipenv --completion)"' >> $HOME/.bashrc && source $HOME/.bashrc


