#!/usr/bin/env bash

# $OSTYPE or uname
# https://stackoverflow.com/questions/394230/how-to-detect-the-os-from-a-bash-script
# https://github.com/dylanaraps/neofetch/issues/433

PICTURES_FOLDER="$HOME/.wallpapers"
case "$OSTYPE" in
    darwin*)
      echo "detected macOS, configuring wallpapers"
      osascript wallpapers.applescript ${PICTURES_FOLDER} 1 true 86400
      ;;
    linux*)
      echo "detected linux, configuring gnome wallpapers"
      ./wallpapers_gnome.py -f ${PICTURES_FOLDER} --interval 1d --random
      ;;
    *)
      echo "detected something else, doing nothing"
      ;;
esac
