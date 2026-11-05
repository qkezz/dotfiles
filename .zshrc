. "$HOME/.local/bin/env"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

PS1="%F{green}%n@%m%f:%F{blue}%~%f%# "

# ALIASES
alias ..='cd ..'
alias ls='ls --color=auto --group-directories-first'
alias la='ls -la --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias v='nvim'

if command -v bat &>/dev/null; then
    alias cat='bat --style=plain --paging=never'
fi

# HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS

# CURSOR (blinking block)
echo -ne '\e[1 q'
