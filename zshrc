### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

# basic stuff
zplugin load zdharma/history-search-multi-word
zplugin light zsh-users/zsh-history-substring-search
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

# portable
for f in ~/.posix.d/*; do
  source $f
done

# zsh-specific
for f in ~/.zsh.d/*; do
  source $f
done

if [ $commands[kubectl] ]; then
    source <(kubectl completion zsh)
fi

if [ $commands[helm] ]; then
    source <(helm completion zsh)
fi
