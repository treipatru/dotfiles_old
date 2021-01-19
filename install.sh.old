#!/bin/bash
# Install dotfiles
# andrei@planet34.org

if ! hash git 2>/dev/null
then
  printf "\n ☲  Git not installed. Exiting... \n"
  exit 0
fi


# ...............................................
while [[ "$ANS1" != "n" && "$ANS1" != "y" ]];
do
  printf "\n ☲  Delete and clone new dotfiles? [y/n]: "
  read ANS1
done
if [ "$ANS1" = "y" ]; then
  cd ~
  rm -rf dotfiles && rm -rf dotscripts
  printf "\n ☲  Deleted local 'dotfiles' ✔\n"
  git clone -q "https://github.com/treipatru/dotfiles.git"
  cd ~/dotfiles && git remote set-url origin "git@github.com:treipatru/dotfiles.git"
  printf "\n ☲  Fetched repo ✔\n"
else
  printf "\n ☲  Program Exterminated \n"
  exit 0
fi


# ...............................................
while [[ "$ANS2" != "n" && "$ANS2" != "y" ]];
do
  printf "\n ☲  Copy/overwrite contents of 'cp'? [y/n]: "
  read ANS2
done
if [ "$ANS2" = "y" ]; then
  cp --remove-destination -r cp/. ~/
  printf "\n ☲  Copied 'cp' ✔\n"
fi


# ...............................................
while [[ "$ANS3" != "n" && "$ANS3" != "y" ]];
do
  printf "\n ☲  Link/overwrite contents of 'ln'? [y/n]: "
  read ANS3
done
if [ "$ANS3" = "y" ]; then
  cp -lrf ln/. ~/
  printf "\n ☲  Created symbolic links to 'ln' ✔ \n"
fi


# ...............................................
while [[ "$ANS4" != "n" && "$ANS4" != "y" ]];
do
  printf "\n ☲  Setup git credentials? [y/n]: "
  read ANS4
done
if [ "$ANS4" = "y" ]; then
  while [[ -z "$EMAIL" ]];
  do
    printf "\n ☲  Email? : "
    read EMAIL
  done
  git config --global user.email "$EMAIL"

  while [[ -z "$NAME" ]];
  do
    printf "\n ☲  Name? : "
    read NAME
  done
  git config --global user.name "$NAME"
  printf "\n ☲  Git set up ✔ \n"
fi