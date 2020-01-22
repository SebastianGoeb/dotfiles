#!/bin/bash

# TODO check for updates regularly in background

formulae=(
  fzf
  jq
  helm
  kubectx
  nvm
  ripgrep
  watch
  zsh
)

brew install "${formulae[@]}"

casks=(
  atom
  iterm2
  itsycal
  keepassxc
  rocket-chat
  spotify
  tunnelblick
  whatsapp
)

brew cask install "${casks[@]}"
