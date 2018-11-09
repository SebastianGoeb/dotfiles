# MUST be executed before some of the keybindings (keybindings.zsh)

autoload -U compinit && compinit
zmodload -i zsh/complist


# Use caching to make completion for commands such as dpkg and apt usable.
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${XDG_CACHE_HOME}/zsh/compcache"

# Show completion descriptions
zstyle ':completion:*' verbose yes

# Make the list prompt friendly
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
# Always show menu list
export LISTMAX=10000

# Make the selection prompt friendly when there are a lot of choices
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# Try regular completions, then ignored completions
zstyle ':completion:*' completer _complete _ignored

# Always show menu
zstyle ':completion:*' menu select=1 _complete _ignored

# zstyle ':completion:*' expand prefix suffix

zstyle ':completion:*' insert-unambiguous true

# Try exact match, then case-insensitive, then partial word
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' +'r:|[.,_-]=* r:|=* l:|=*'
zstyle ':completion:*' original false
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' use-compctl false

if [ $commands[kubectl] ]; then
    source <(kubectl completion zsh)
fi

if [ $commands[helm] ]; then
    source <(helm completion zsh)
fi
