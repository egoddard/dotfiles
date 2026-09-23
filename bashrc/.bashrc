HISTCONTROL=ignoreboth:erasedups

export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$HOME/.local/bin:$HOME/.tfenv/bin:$PATH"

if [[ -d "/home/linuxbrew/.linuxbrew" ]]; then
    export PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if command -v direnv >/dev/null; then
    eval "$(direnv hook bash)"
fi

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin

if [[ -d "/opt/homebrew/opt/grep/libexec/gnubin" ]]; then
    export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
fi

if [[ -d "$HOME/.cargo" ]]; then
    . "$HOME/.cargo/env"
fi

export PGCLIENTENCODING=utf-8

alias lg='lazygit'
alias ll='eza --long --git -aho --no-permissions'
alias tree='eza --long --git -ahoT --no-permissions'
alias cat='bat'
alias less='bat'

batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
}

if [[ -f "$HOME/.custom_shell_functions.sh" ]]; then
    source "$HOME/.custom_shell_functions.sh"
fi
