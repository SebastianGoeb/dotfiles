#!/usr/bin/env bash

# install homebrew: https://brew.sh/
if [ ! $commands[brew] ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# install ansible
if [ ! $commands[ansible] ]; then
  brew install ansible
fi

