
function iso_date() {
  # https://stackoverflow.com/a/7216394/916223
  date +%Y-%m-%dT%H:%M:%S%z
}

log_level=2
function debug() {
  (( log_level <= 1 )) && printf '%s DEBUG %s\n' $(iso_date) $1
}
function info() {
  (( log_level <= 2 )) && printf '%s INFO  %s\n' $(iso_date) $1
}
function warn() {
  (( log_level <= 3 )) && printf '%s WARN  %s\n' $(iso_date) $1
}
function error() {
  (( log_level <= 4 )) && printf '%s ERROR %s\n' $(iso_date) $1
}

debug 'If macos, init path'
if [[ -f /usr/libexec/path_helper ]]; then
  eval `/usr/libexec/path_helper -s`
fi

debug 'Install zinit if not found'
if [[ ! -f "$HOME/.zinit/bin/zinit.zsh" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
fi

debug 'Added by zinit installer'
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
debug 'End of zinit installer chunk'

debug 'basic plugins'
zinit load zdharma/history-search-multi-word
zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting

debug 'completion'
zinit light zsh-users/zsh-completions
zinit light gradle/gradle-completion

# debug 'fzf (disabled)'
# zinit ice from"gh-r" as"program"; zinit load junegunn/fzf-bin

debug 'theme'
zinit ice pick"async.zsh" src"pure.zsh"; zinit light sindresorhus/pure

# not sure what this does
# zinit creinstall %HOME/my_completions  # Handle completions without loading any plugin, see "clist" command

debug 'portable scripts'
for f in ~/.posix/*; do
  source $f
done

debug 'zsh scripts'
for f in ~/.zsh/*; do
  source $f
done

debug 'kubectl completions'
if [ $commands[kubectl] ]; then
    source <(kubectl completion zsh)
fi

debug 'helm completions'
if [ $commands[helm] ]; then
    source <(helm completion zsh)
fi

debug 'Added by zinit installer'
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
debug 'End of zinit installer chunk'

debug 'fzf'
. "$HOME"/.fzf/fzf-options.sh
. "$HOME"/.fzf/fzf.zsh
