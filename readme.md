# Dotfiles

> Setup own configuration files for Unix-like environments.

## Install

`bash <(wget -O - http://planet34.org/dotinstall)`

## Script

The [the install script](https://github.com/treipatru/dotfiles/blob/master/scripts/dotinstall.sh) is parametric so you can plug it into your own dotfiles repo. Feel free to use it and improve it.

### Variables

```
REPOHTTPS="https://github.com/treipatru/dotfiles.git" # HTTPS link to your repo
REPOSSH="git@github.com:treipatru/dotfiles.git"       # SSH link to your repo
SWITCHTOSSH=true                                      # Set upstream as SSH after repo is downloaded
DOTFOLDER="dotfiles"                                  # Name of your dotfiles folder
IGNORELIST='git|md'                                   # Files & folders to ignore
```


### How it works

1. Removes DOTFOLDER from home folder for clean install
2. Clones repo via REPOHTTPS to avoid credentials request then switches the origin to REPOSSH
3. Loops through files and folders in repo and processes entries

Some rules for processing:

* Entries in IGNORELIST are ignored completely.
* Entries which already exist locally ask for overwrite confirmation.
* `.local` files are never overwritten if they exist.
* Files in repo root are soft linked to home root so that changes can be easily made and pushed.
* Folders are copied, not linked. This is to avoid local content being rewritten and especially deleted (e.g. keys in `.ssh/`).

### What it looks like

Here's a gif of it running, why not

![Running the script](https://i.imgur.com/MKj0z7j.gif)
