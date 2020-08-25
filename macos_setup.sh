#!/bin/bash

# TODO check for updates regularly in background

xcode-select --install

formulae=(
  fzf
  git
  helm@2
  iproute2mac
  jq
  kubectx
  maven
  nmap
  nvm
  openvpn
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
