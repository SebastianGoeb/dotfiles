#!/bin/bash

# TODO check for updates regularly in background

xcode-select --install

formulae=(
  fzf
  git
  helm@2
  iproute2mac
  jq
  go
  helm
  kubectx
  maven
  nmap
  nvm
  openvpn
  ripgrep
  tree
  vifm
  watch
  zsh
)

brew install "${formulae[@]}"

# finish fzf setup
[ -f ~/.fzf.zsh ] || "$(brew --prefix)/opt/fzf/install"

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
