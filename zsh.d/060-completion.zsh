## MUST be executed before some of the keybindings (keybindings.zsh)

# Keep directories and files separated
zstyle ':completion:*' list-dirs-first true

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-} l:[,._-]||=* l:||[,._-]=* l:|=* r:|=*'
zstyle ':completion:*' force-list always
zstyle ':completion:*' menu yes select
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/Users/sebastian/.zshrc'

autoload -Uz compinit && compinit
zmodload -i zsh/complist
