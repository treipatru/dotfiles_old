# .bashrc
#

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


# User settings ----------------------------------------------------------------
# Use themes?
USE_COLOR=true
# See available files in .bash-colors/
THEME='base16-material-darker'
# Show git status in prompt?
USE_GIT=true
# Load external git status script?
USE_EXT_SCRIPT=true
# Use z jumper?
USE_Z=true


# Bash options -----------------------------------------------------------------
# Don't put duplicate lines in the history.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth
# Append to the history file, don't overwrite it
shopt -s histappend
# Unlimited history size
HISTSIZE=-1
HISTFILESIZE=-1
# Completion if available
if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi


# Bash extras ------------------------------------------------------------------
# Set vim as default editor
export EDITOR=/usr/local/bin/vim
# Import generic aliases
if [ -e ~/.aliases ]; then
    . ~/.aliases
fi
# Import local aliases
if [ -e ~/.aliases.local ]; then
    . ~/.aliases.local
fi
# Load z file jumper
if [ -e ~/scripts/z.sh ] && [ "$USE_Z" = true ]; then
    source ~/scripts/z.sh
fi


# Visual tweaks ----------------------------------------------------------------
# Set color terminal
export TERM=xterm-256color
# Set terminal
if [ "$USE_COLOR" = true ] ; then
    source ~/.bash-colors/${THEME}.sh
fi
# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# Git status -------------------------------------------------------------------
if [ "$USE_GIT" = true ] ; then

    if [ "$USE_EXT_SCRIPT" = true ] ; then
        source ~/scripts/.git-prompt.sh
    fi

    GIT_PS1_SHOWDIRTYSTATE=true
    GIT_PS1_SHOWUNTRACKEDFILES=true
    GIT_PS1_SHOWUPSTREAM="verbose"

    git_current_branch_name="\$(__git_ps1 '%s' | sed 's/ .\+//' | sed -e 's/[\\\\/&]/\\\\\\\\&/g')"
    git_status_substitutes=(
        "s/$git_current_branch_name//;" # remove branch temporarily
        "s/u//;" # upstream
        "s/+\([0-9]\+\)/\033[1;34m\▴\1/;" # outgoing
        "s/-\([0-9]\+\)/\033[1;34m\▾\1/;" # incoming
        "s/%/\033[1;30m\ ?/;" # untracked
        "s/+/\033[1;32m\ ✓/;" # staged
        "s/*/\033[1;31m\✕/;" # unstaged
        "s/\(.\+\)/\[\033[0;33m\] $git_current_branch_name\1/;" # insert branch again
    )
    git_status_command="\$(__git_ps1 '%s'| sed \"${git_status_substitutes[@]}\")"
fi


# Export prompt ----------------------------------------------------------------
export PS1="\[\033[0;33m\][\[\033[1;37m\]\u@\[\033[1;36m\]\h\[\033[0m\]: \w$git_status_command\[\033[0;33m\]]\[\033[1;37m\]\n\$\[\033[0m\] "

unset git_status_substitutes git_status_command git_current_branch_name
