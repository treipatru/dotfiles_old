source $HOME/.config/zsh/exports
source $HOME/.config/zsh/aliases

# HISTORY
#..................................................................................................
# Remove superfluous blanks from each command line being added to the history
# list
setopt histreduceblanks
# Remove command lines from the history list when the first character on the
# line is a space, or when one of the expanded aliases contains a leading space
setopt histignorespace

# Do not enter command lines into the history list if they are duplicates of the
# previous event.
setopt histignorealldups

# Don't kill background jobs when I logout
setopt nohup

# See: http://zsh.sourceforge.net/Intro/intro_2.html
setopt extendedglob

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
plugins=(git z zsh-autosuggestions colored-man-pages)

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
