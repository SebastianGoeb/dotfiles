function debug() {
  # echo "$(gdate "+%T.%6N") $1"
}

debug 'powerlevel10k instant prompt'
# should be as early as possible, but before anything that uses stdin/stdout
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -f /usr/libexec/path_helper ]]; then
  debug 'if macos, init path'
  eval `/usr/libexec/path_helper -s`
fi

# =============================
# ZINIT CHEAT SHEET (you WILL forget what the commands mean!)
# zinit ice -> sets modifiers for the next command
# zinit load -> loads a plugin WITH reporting/investigating
# zinit light -> loads a plugin WITHOUT reporting/investigating
# zinit snippet -> loads a local or remote script (not a github repo)
# zinit ice wait["1"]; zinit light ... -> loads plugin asynchronously via ZLE, optionally with a delay
# zinit ice lucid -> quiet mode
# zinit wait lucid for A B light-mode C -> shorthand for `ice + load`, applies modifiers `wait, lucid` to plugins `A, B` and `wait, lucid, light-mode` to plugin `C`
# zinit times -a -> report plugin loading moments and times
# =============================

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [[ ! -f "$ZINIT_HOME/zinit.zsh" ]]; then
  debug 'installing zinit'
  bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
fi

debug 'zinit'
source "$ZINIT_HOME/zinit.zsh"



# # generic
# bindkey -e
# bindkey "^[[A" history-substring-search-up # up
# bindkey "^[[B" history-substring-search-down # down
# bindkey "^[[2~" overwrite-mode # ins
# bindkey -M menuselect "^[[Z" reverse-menu-complete # shift + tab

# # macOS
# bindkey "^[^[[D" backward-word # alt + left
# bindkey "^[^[[C" forward-word # alt + right
# bindkey "^[OH" beginning-of-line # cmd + left ?
# bindkey "^[OF" end-of-line # cmd + right ?

# # Windows
# bindkey "^[[1;5D" backward-word # ctrl + left
# bindkey "^[[1;5C" forward-word # ctrl + right
# bindkey "^[[H" beginning-of-line # home
# bindkey "^[[F" end-of-line # end
# bindkey "^[[3~" delete-char # del

# # Linux
# # bindkey "^[OA" history-substring-search-up # up
# # bindkey "^[OB" history-substring-search-down # down

# # IntelliJ on Linux
# bindkey "^[O5D" backward-word # ctrl-left
# bindkey "^[O5C" forward-word # ctrl-right



debug 'plugins'
# defer loading as many plugins as possible to improve startup time (turbo mode)
# syntax-highlighting replays buffered compdef commands before loading
# zsh-completions are (re-)installed to disk on installation/update
# homebrew already manages completions for its programs (yq, kubectl, etc.)
zi wait lucid for \
  atinit"zicompinit; zicdreplay" zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" zsh-users/zsh-autosuggestions \
  blockf atclone'zinit creinstall -q .' atpull"%atclone" zsh-users/zsh-completions \
  zdharma-continuum/history-search-multi-word
  # zsh-users/zsh-history-substring-search

debug 'theme'
zi depth=1 light-mode for romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

debug 'portable scripts'
for f in ~/.posix/*; do
  debug "sourcing $f"
  . $f
done

# debug 'zsh scripts'
# for f in ~/.zsh/*; do
#   debug "sourcing $f"
#   . $f
# done

debug 'programs'
eval "$(nodenv init -)"

debug 'completion settings'

# https://unix.stackexchange.com/questions/214657/what-does-zstyle-do
# Do menu-driven completion.
zstyle ':completion:*' menu select

# Color completion for some things.
# http://linuxshellaccount.blogspot.com/2008/12/color-completion-using-zsh-modules-on.html
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# formatting and messages
# http://www.masterzen.fr/2009/04/19/in-love-with-zsh-part-one/
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format "$fg[yellow]%B--- %d%b"
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# case insensitive substring expansion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

debug 'done'
