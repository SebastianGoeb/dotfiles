################
# Zsh Settings #
################

# reset fpath
tmp=()
for el in $fpath; do
    [[ $el =~ '^/usr' ]] && tmp+=($el)
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

# configure history
HISTFILE=$HOME/.histfile
HISTSIZE=100000
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt incappendhistory

# enable implicit `cd`
setopt autocd

# keybindings
bindkey -e
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line
bindkey "^[[2~" overwrite-mode
bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word
