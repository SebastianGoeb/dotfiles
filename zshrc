#!/usr/bin/env zsh

local f

# generic
for f in ~/.posix.d/*; do
  source $f
done

# zsh specific
for f in ~/.zsh.d/*; do
  source $f
done
