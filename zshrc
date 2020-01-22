### If macos, init path
if [[ -f /usr/libexec/path_helper ]]; then
  eval `/usr/libexec/path_helper -s`
fi

### Install zinit if not found
if [[ ! -f "$HOME/.zinit/bin/zinit.zsh" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
fi

### Added by zinit's installer

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of zinit's installer chunk

# basic stuff
zinit load zdharma/history-search-multi-word
zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting

# completions
zinit light zsh-users/zsh-completions
zinit light gradle/gradle-completion

# fzf
# zinit ice from"gh-r" as"program"; zinit load junegunn/fzf-bin

# theme
zinit ice pick"async.zsh" src"pure.zsh"; zinit light sindresorhus/pure

# not sure what this does
# zinit creinstall %HOME/my_completions  # Handle completions without loading any plugin, see "clist" command

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

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p $HOME/.zinit
    command git clone https://github.com/zdharma/zinit $HOME/.zinit/bin && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%F" || \
        print -P "%F{160}▓▒░ The clone has failed.%F"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk

export FZF_DEFAULT_OPTS="--height=50% --preview=\"cat {}\" --bind='ctrl-p:toggle-preview'"
export FZF_DEFAULT_COMMAND="rg --files 2>/dev/null"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
