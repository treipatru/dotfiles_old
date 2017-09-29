# .bashrc
#

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Don't put duplicate lines in the history. See bash(1) for more options
# Don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# Unlimited power
HISTSIZE=-1
HISTFILESIZE=-1

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# set vim as default editor
export EDITOR=/usr/local/bin/vim

## import files, assuming they're always there
. ~/.aliases
. ~/.aliases.local

# Set color terminal
export TERM=xterm-256color

# Terminal theme
source ~/base16-monokai.sh

# Get current git branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ on \1/'
}

# Prompt
export PS1="\n\[\033[0;33m\][\[\033[1;37m\]\u@\[\033[1;36m\]\h\[\033[0m\]: \w\[\033[0;32m\]\$(parse_git_branch)\[\033[0;33m\]]\[\033[1;37m\]\n\$\[\033[0m\] "

# Load z file jumper
source ~/scripts/z.sh