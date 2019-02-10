
### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

# basic stuff
zplugin load zdharma/history-search-multi-word
zplugin light zsh-users/zsh-autosuggestions
zplugin light zdharma/fast-syntax-highlighting

# completions
zplugin light zsh-users/zsh-completions
zplugin light gradle/gradle-completion

# fzf
# zplugin ice from"gh-r" as"program"; zplugin load junegunn/fzf-bin

# theme
zplugin ice pick"async.zsh" src"pure.zsh"; zplugin light sindresorhus/pure

# not sure what this does
# zplugin creinstall %HOME/my_completions  # Handle completions without loading any plugin, see "clist" command

# The following lines were added by compinstall


# Keep directories and files separated
zstyle ':completion:*' list-dirs-first true


zstyle ':completion:*' completer _complete _ignored
# zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+r:|[._-/]=** r:|=**' '+l:|=* r:|=*'
zstyle ':completion:*' matcher-list '' 'r:|?=** m:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-}'


# # Smart matching of dashed values, e.g. f-b matching foo-bar
# zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*'

zstyle ':completion:*' force-list always
zstyle ':completion:*' menu yes select
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/Users/sebastian/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd notify
bindkey -e
# End of lines configured by zsh-newuser-install
