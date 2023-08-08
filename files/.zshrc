#!/bin/zsh

# Options
setopt EXTENDED_HISTORY
setopt HIST_BEEP
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt extendedglob                # See: http://zsh.sourceforge.net/Intro/intro_2.html
setopt nohup                       # Don't kill background jobs on close session

# Sources
ZSH_CFG="$HOME/.config/zsh"
source $ZSH_CFG/aliases
source $ZSH_CFG/exports

# Plugins
source $ZSH_CFG/zplug

source /usr/share/nvm/init-nvm.sh

# Startup
autoload -U compinit; compinit
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

