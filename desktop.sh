#!/usr/bin/env bash

PICTURES_FOLDER="$HOME/.wallpapers"

case "$OSTYPE" in
    bsd*)
    echo "detected bsd, doing nothing"
    ;;
    darwin*)
    echo "detected macOS, installing wallpapers"
    osascript desktop.applescript "$HOME/.wallpapers" 1 true 86400
    ;;
    *)
    echo "detected something else, doing nothing"
    ;;
esac
