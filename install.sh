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

# Create symlinks recursively from a folder to another folder
# Ignores .config folders to avoid rewriting ~/.config
MakeSymlinks () {
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

# Symlink dotfiles to root
LinkNodes () {
    MakeSymlinks ~/repos/dotfiles/files/ ~/
    MakeSymlinks ~/repos/dotfiles/files/.config ~/.config
    # All done
    ConsoleExit "Dotfiles linked."
}



######## Check
# Git
if ! hash git 2>/dev/null; then ConsoleExit "Install Git to continue"; fi

# Repository already present
if [[ -d ~/repos/dotfiles ]]
then
    ConsoleLog "Local dotfiles repository already exists. Skipping download."
    while true; do
        read -p "Re-link files? This will DELETE unversioned files, if existing. [y/n]" yn
        case $yn in
            [Yy]* ) LinkNodes;break;;
            [Nn]* ) ConsoleLog "Script finished.";exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
fi



######## Run
# Make any missing dirs
mkdir -p {~/.config,~/scripts,~/.ssh,~/repos}

# Clone repo
git -C ~/repos/ clone https://github.com/treipatru/dotfiles.git
cd ~/repos/dotfiles \
    && git remote set-url origin "git@github.com:treipatru/dotfiles.git" \
    && cd -

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
LinkNodes 
