## MUST be executed before some of the keybindings (keybindings.zsh)

# Keep directories and files separated
zstyle ':completion:*' list-dirs-first true

# zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+r:|[._-/]=** r:|=**' '+l:|=* r:|=*'
# # Smart matching of dashed values, e.g. f-b matching foo-bar
# zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*'

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list '' 'r:|?=** m:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-}'
zstyle ':completion:*' force-list always
zstyle ':completion:*' menu yes select
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/Users/sebastian/.zshrc'

autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit
zmodload -i zsh/complist

if [ $commands[az] ]; then
    source /usr/local/etc/bash_completion.d
fi
