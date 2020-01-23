#!/bin/bash

# TODO check for updates regularly in background

xcode-select --install

formulae=(
  fzf
  git
  helm
  jq
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
