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
GitSourceUrl=https://github.com/treipatru/dotfiles.git
GitDestinationPath=~/repos/dotfiles
GitDestinationRoot=${GitDestinationPath%/*}
SourceRootConfig=tst

# Logging
ConsoleLog () { printf "\n ░░▎${1}\n"; }

# Abort install
ConsoleExit () { ConsoleLog "$@"; ConsoleLog "Aborting install"; exit 0; }

# Recursively link all files from one location to another
RecursiveLink () {
    local source=$1/**.*

    for node in $source
    do
        echo $node
        # if [[ -d $node ]]; then RecursiveLink $node; fi
        # if [[ -f $node ]]; then echo $node; fi
    done
}


######## Check
# Git
if ! hash git 2>/dev/null; then ConsoleExit "Install Git to continue"; fi

# Repository already present
# [[ -d $GitDestinationPath ]] && ConsoleExit "${GitDestinationPath} already exists."


######## Run
# Make any missing dirs
# mkdir -p {~/.config,~/scripts,~/.ssh,$GitDestinationRoot}

# Clone repo
# git -C $GitDestinationRoot clone $GitSourceUrl 

# Touch additional config files
# touch ~/{.zsh.local,.aliases.local}

# Create example config SSH
# [[ ! -f ~/.ssh/config ]] && echo \
# "host example.com
# 	HostName example.com
# 	Port 22
# 	IdentityFile ~/.ssh/id_rsa
# 	User login"\
# >> ~/.ssh/config

# Link config files to ~
pth=${GitDestinationPath}/${SourceRootConfig}/
find $pth -mindepth 1 -type d| while read lnSource; do
    lnDest=~/${lnSource#"$pth"}
    echo "link dest: " $lnDest
    # ln -sf $lnSource $lnDest
    # [[ -f $lnDest ]] && ln -sf $lnDest
done

# find $pth -type f| while read lnSource; do
#     lnDest=~/${lnSource#"$pth"}
#     echo "link dest: " $lnDest
#     ln -sf $lnSource $lnDest
# done
