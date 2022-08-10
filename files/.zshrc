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
source $HOME/.config/broot/launcher/bash/br
source $ZSH_CFG/aliases
source $ZSH_CFG/exports
source $ZSH_CFG/broot
source $ZSH_CFG/plugins/fzf/fzf

source $ZSH_CFG/plugins/vi-mode/zsh-vi-mode.plugin.zsh
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE

# fd() {
#   preview="git diff $@ --color=always -- {-1}"
#   git diff $@ --name-only | fzf -m --ansi --preview $preview | xargs git add --verbose
# }

zvm_after_init_commands+=('[ -f $ZSH_CFG/plugins/fzf/fzf ] && source $ZSH_CFG/plugins/fzf/fzf')

# Startup
autoload -U compinit; compinit
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
