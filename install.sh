#!/bin/sh

# 
#   (          ) (       (         
#   )\ )    ( /( )\ ) (  )\  (     
#  (()/( (  )\()|()/( )\((_)))\(   
#   ((_)))\(_))/ /(_)|(_)_ /((_)\  
#   _| |((_) |_ (_) _|(_) (_))((_) 
# / _` / _ \  _| |  _|| | / -_|_-< 
# \__,_\___/\__| |_|  |_|_\___/__/ 
# 

console_log () {
  printf "\n >>>>> ${1} \n"
}

console_exit () {
  printf "\n >>>>> ${1}"
  printf "\n >>>>> Aborting install"
  exit 0
}

# Exit if no git
if ! hash git 2>/dev/null; then console_exit "Install Git to continue"; fi

# Exit if dotfiles already present
 [[ ! -d ~/repos/dotfiles ]] && console_exit "/repos/dotfiles already exists. Update via Git."

#
git clone "https://github.com/treipatru/dotfiles.git"

# Make some folders if they don't exist
mkdir -p {~/.config,~/repos,~/scripts,~/.ssh,~/.wsh}

# Touch empty config files
touch ~/{.zsh.local,.aliases.local}

# Create example config SSH
[[ ! -f ~/.ssh/config ]] && echo \
"host example.com
	HostName example.com
	Port 22
	IdentityFile ~/.ssh/id_rsa
	User login"\
>> ~/.ssh/config
