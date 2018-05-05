#!/bin/bash
# Install dotfiles
# andrei@planet34.org

# Utilities  -------------------------------------------------------------------
OVERWRITEALL=false
CURRENTFILE=""

function format_output {
  printf "◈ $1 \n"
}

function copy_item {
  cp -r ~/dotfiles/"$CURRENTFILE" ~/"$CURRENTFILE"
}

function link_item {
  ln -s ~/dotfiles/"$CURRENTFILE" ~/"$CURRENTFILE"
}

function get_input {
  if [ "$OVERWRITEALL" = true ]; then
    format_output "Overwriting $CURRENTFILE ✔"
    rm -rf ~/"$CURRENTFILE"
    link_item
  else
    format_output "Overwrite local \x1B[34m$CURRENTFILE\e[0m ? [Y/N/All]"
    printf "◇ "
    read ANSWER
    if [ "${ANSWER,,}" = "y" ]; then
      format_output "OK ✔\n"
      rm -rf ~/"$CURRENTFILE"
      link_item
    elif [ "${ANSWER,,}" = "n" ]; then
      format_output "Skipped ×\n"
    elif [ "${ANSWER,,}" = "all" ]; then
      OVERWRITEALL=true
      format_output "Overwriting rest of files \n"
    else
      format_output "Try again"
      get_input
    fi
  fi
}

# Startup ----------------------------------------------------------------------
printf "\nStarting...\n"

# Enable extended globbing
shopt -s extglob

# Set dir
cd $HOME

# Make sure we're fresh
rm -rf ~/dotfiles
format_output "Cleaned ~/dotfiles ✔"

# Clone repository using https so we don't require password
git clone -q https://github.com/treipatru/dotfiles.git && cd dotfiles
format_output "Cloned repo ✔\n"

# Switch origin to use ssh instead of https later
git remote set-url origin git@github.com:treipatru/dotfiles.git

# Loop through files & folders
for f in *(.)[^.]*; do
  CURRENTFILE="$f"

  # If directory
  if [ -d ~/"$CURRENTFILE" ]; then
    # Skip git meta
    if [ "$CURRENTFILE" = ".git" ]; then
      echo
    fi
    # Copy folder and contents
    format_output "Copying folder \x1B[34m$CURRENTFILE\e[0m"
    cp -ir "$CURRENTFILE" ~/
    printf "\n"

  # If file
  elif [ -f ~/"$CURRENTFILE" ]; then
    # Always prefer existing .local files
    if [ ${CURRENTFILE: -6} = ".local" ]; then
      format_output "Not replacing local version of \x1B[34m$CURRENTFILE\e[0m\n"
    else
      get_input
    fi

  # If nothing
  else
    # Skip git meta
    if [ "$CURRENTFILE" = ".git" ]; then
      echo
    else
      # Copy if item doesn't exist
      format_output "Creating \x1B[34m$CURRENTFILE\e[0m ✔\n"
      copy_item
    fi
  fi
done;

# All setup
format_output "All done ✔\n"