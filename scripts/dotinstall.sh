#!/bin/bash
# Install dotfiles
# andrei@planet34.org

# Utilities  -------------------------------------------------------------------
REPOHTTPS="https://github.com/treipatru/dotfiles.git"
REPOSSH="git@github.com:treipatru/dotfiles.git"
SWITCHTOSSH=true
DOTFOLDER="dotfiles"
OVERWRITEALL=false
CURRENTFILE=""
SKIPCURRENT=false
IGNORELIST='git|md'

function format_output {
  printf "◈ $1 \n"
  sleep .3
}

function copy_item {
  cp -r ~/"$DOTFOLDER"/"$CURRENTFILE" ~/"$CURRENTFILE"
}

function link_item {
  ln -s ~/"$DOTFOLDER"/"$CURRENTFILE" ~/"$CURRENTFILE"
}

function check_ignored {
  FILEEXT="${CURRENTFILE##*.}"
  if [[ "$FILEEXT" =~ ^($IGNORELIST)$ ]] ; then
    SKIPCURRENT=true
  else
    SKIPCURRENT=false
  fi
}

function get_input {
  if [ "$OVERWRITEALL" = true ]; then
    format_output "Overwriting $CURRENTFILE ✔"
    rm -rf ~/"$CURRENTFILE"
    link_item
  else
    format_output "Overwrite local \e[94m$CURRENTFILE\e[0m ? [Y/N/All]"
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
rm -rf ~/"$DOTFOLDER"
format_output "Cleaned ~/"$DOTFOLDER" ✔"

# Clone repository using https so we don't require password
git clone -q "$REPOHTTPS" && cd "$DOTFOLDER"
format_output "Cloned repo ✔\n"

# Switch origin to use ssh instead of https later
if [ "$SWITCHTOSSH" = true ]; then
  git remote set-url origin "$REPOSSH"
fi

# Loop through files & folders
for f in *(.)[^.]*; do
  CURRENTFILE="$f"
  check_ignored

  # Do nothing if on ignore list
  if [ "$SKIPCURRENT" = true ]; then
    format_output "Ignoring \e[94m$CURRENTFILE\e[0m \n"

  # Else process entry
  else
    # If entry exists as directory
    if [ -d ~/"$CURRENTFILE" ]; then
      # Copy folder and contents
      format_output "Copying folder \e[94m$CURRENTFILE\e[0m"
      cp -ir "$CURRENTFILE" ~/
      printf "\n"

    # If entry exists as file
    elif [ -f ~/"$CURRENTFILE" ]; then
      # Always prefer existing .local files
      if [ ${CURRENTFILE: -6} = ".local" ]; then
        format_output "Keeping local version of \e[94m$CURRENTFILE\e[0m\n"
      else
        get_input
      fi

    # If entry does not exist in local files
    else
      format_output "Creating \e[94m$CURRENTFILE\e[0m ✔\n"
      # Copy folders
      if [ -d "$CURRENTFILE" ]; then
        copy_item
      # Link files
      elif [ -f "$CURRENTFILE" ]; then
        link_item
      fi
    fi
  fi
done;

# Finished
format_output "All done ✔\n"
