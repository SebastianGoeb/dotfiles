#!/usr/bin/env bash

PICTURES_FOLDER="$HOME/.wallpapers"

case "$OSTYPE" in
    bsd*)
    echo "detected bsd, doing nothing"
    ;;
    darwin*)
    echo "detected macOS, installing wallpapers"
    osascript wallpapers.applescript "$HOME/.wallpapers" 1 true 86400
    ;;
    *)
    echo "detected something else, configuring gnome wallpaper slideshow"
    ./wallpapers_gnome.py -f "$HOME/.wallpapers" --interval 1d --random
    ;;
esac
