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



######## Defs
# Logging
ConsoleLog () { printf "\n░▎${1}\n"; }

# Abort install
ConsoleExit () { ConsoleLog "$@"; ConsoleLog "End script"; exit 0; }

# Link contents of a folder to another folder
LinkNodes () {
    local srcFolder=$1
    local dstFolder=$2

    find $srcFolder -mindepth 1 -maxdepth 1|while read nodeSrc; do
        nodeName=$(sed "s@.*/@@" <<< $nodeSrc)
        if [ "$nodeName" != ".config" ]; then
            rm -rf ${dstFolder}/${nodeName}
            ln -s $nodeSrc ${dstFolder}/${nodeName}
        fi
    done
}



######## Check
# Git
if ! hash git 2>/dev/null; then ConsoleExit "Install Git to continue"; fi

# Repository already present
[[ -d ~/repos/dotfiles ]] && ConsoleExit "Local dotfiles repository already exists."



######## Run
# Make any missing dirs
mkdir -p {~/.config,~/scripts,~/.ssh,~/repos}

# Clone repo
git -C ~/repos/ clone https://github.com/treipatru/dotfiles.git

# Touch additional non-versioned config files
touch ~/{.zsh.local,.aliases.local}

# Create example config SSH
[[ ! -f ~/.ssh/config ]] && echo \
"host example.com
	HostName example.com
	Port 22
	IdentityFile ~/.ssh/id_rsa
	User login"\
>> ~/.ssh/config

# Install confirmation
while true; do
    read -p "Link new files? This will DELETE your current files, if existing. [y/n]" yn
    case $yn in
        [Yy]* ) ConsoleLog "Continuing";break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Link .config files and folders to ~/.config
LinkNodes ~/repos/dotfiles/files/.config ~/.config

# Link home root files and folders to ~/
LinkNodes ~/repos/dotfiles/files/ ~/

# All done
ConsoleExit "All done"
