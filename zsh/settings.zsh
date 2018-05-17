################
# Zsh Settings #
################

# reset fpath
tmp=()
for el in $fpath; do
    ! [[ $el =~ 'zplug' ]] && tmp+=($el)
done
export fpath=($tmp)
unset tmp

# configure zshcompsys
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=**'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original false
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle :compinstall filename '/Users/sebastian/.zshrc'

autoload -Uz compinit
compinit

# configure backward-kill
autoload -U select-word-style
select-word-style bash

# configure history
HISTFILE=$HOME/.histfile
HISTSIZE=100000
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt incappendhistory

# enable implicit `cd`
setopt autocd

# generic keybindings
bindkey -e
bindkey "^[[A" history-substring-search-up # up
bindkey "^[[B" history-substring-search-down # down
bindkey "^[[2~" overwrite-mode # ins

# macOS keybindings
bindkey "^[^[[D" backward-word # alt + left
bindkey "^[^[[C" forward-word # alt + right
bindkey "^[OH" beginning-of-line # cmd + left ?
bindkey "^[OF" end-of-line # cmd + right ?

# Windows
bindkey "^[[1;5D" backward-word # ctrl + left
bindkey "^[[1;5C" forward-word # ctrl + right
bindkey "^[[H" beginning-of-line # home
bindkey "^[[F" end-of-line # end
bindkey "^[[3~" delete-char # del
