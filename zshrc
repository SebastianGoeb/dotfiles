
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

debug 'load zinit'
source "$HOME/.zinit/bin/zinit.zsh"

debug 'zinit basic plugins'
zinit load zdharma/history-search-multi-word
zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting

debug 'zinit completion'
zinit light zsh-users/zsh-completions
zinit light gradle/gradle-completion

# debug 'zinit fzf (disabled)'
# zinit ice from"gh-r" as"program"; zinit load junegunn/fzf-bin

debug 'zinit theme'
zinit ice pick"async.zsh" src"pure.zsh"; zinit light sindresorhus/pure

# not sure what this does
# zinit creinstall %HOME/my_completions  # Handle completions without loading any plugin, see "clist" command

debug 'portable scripts'
for f in ~/.posix/*; do
  debug "sourcing $f"
  . $f
done

debug 'zsh scripts'
for f in ~/.zsh/*; do
  debug "sourcing $f"
  . $f
done

debug 'kubectl completions'
if [ $commands[kubectl] ]; then
    source <(kubectl completion zsh)
fi

debug 'helm completions'
if [ $commands[helm] ]; then
    source <(helm completion zsh)
fi

# debug 'zinit completions (need to do this manually, since we sourced zinit.zsh after calling compinit)'
# autoload -Uz _zinit
# (( ${+_comps} )) && _comps[zinit]=_zinit

debug 'fzf'
. "$HOME"/.fzf/fzf-options.sh
. "$HOME"/.fzf/fzf.zsh
