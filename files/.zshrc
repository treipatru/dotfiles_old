source $HOME/.config/zsh/exports

# History
setopt EXTENDED_HISTORY
setopt HIST_BEEP
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS

# Don't kill background jobs on close session
setopt nohup

# See: http://zsh.sourceforge.net/Intro/intro_2.html
setopt extendedglob

# NNN change directory on quit
if [ -f /usr/share/nnn/quitcd/quitcd.bash_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_zsh
fi

# Cfg third party things
#..................................................................................................
# ZSH
ZSH_THEME=""
HIST_STAMPS="yyyy-mm-dd"
plugins=(git z zsh-autosuggestions colored-man-pages)
# Pure Prompt
autoload -U promptinit; promptinit
prompt pure
# Load OMZSH
source $ZSH/oh-my-zsh.sh
# Set vi mode
bindkey -v
# FZF
source $HOME/.config/zsh/fzf

# X
#..................................................................................................
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  startx
fi

# Other
#..................................................................................................
batdiff() {
    git diff --name-only --diff-filter=d | xargs bat --diff
}

source $HOME/.config/zsh/aliases

source ~/.config/broot/launcher/bash/br

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
