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
setopt share_history               # Share history between open sessions
setopt nohup                       # Don't kill background jobs on close session

# Broot git diff
function gg {
    br --conf ~/.config/broot/git-diff-conf.toml --git-status
}

# Sources
ZSH_CFG="$HOME/.config/zsh"
source $HOME/.config/broot/launcher/bash/br
source $ZSH_CFG/aliases
source $ZSH_CFG/exports
source $ZSH_CFG/plugins/fzf/completion.zsh
source $ZSH_CFG/plugins/fzf/key-bindings.zsh
source $ZSH_CFG/plugins/vi-mode/zsh-vi-mode.plugin.zsh

# Startup
autoload -U compinit; compinit
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
