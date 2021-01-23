source $HOME/.config/zsh/exports
source $HOME/.config/zsh/aliases

# OHMYZSH OPTIONS
#..................................................................................................
ZSH_THEME=""
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
HIST_STAMPS="yyyy-mm-dd"

# Pure Prompt
autoload -U promptinit; promptinit
prompt pure

# Plugins
plugins=(git z zsh-autosuggestions)

#
source $ZSH/oh-my-zsh.sh

# Set vi mode
bindkey -v

# NNN change directory on quit 
if [ -f /usr/share/nnn/quitcd/quitcd.bash_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_zsh
fi

# FZF
source $HOME/.config/zsh/fzf

# X 
#..................................................................................................
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  startx
fi
