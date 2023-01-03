# =============================
# LOGGING
# =============================

function iso_date() {
  perl -e '
    use Time::HiRes qw( gettimeofday );
    use POSIX qw( strftime );
    my ($sec, $usec) = gettimeofday();
    printf( "%s.%03d", strftime( "%Y-%m-%d %H:%M:%S", localtime $sec ), $usec/1000);
  '
}

function debug() {
  (( log_level <= 1 )) && printf '%s DEBUG %s\n' "$(iso_date)" $1
}
function info() {
  (( log_level <= 2 )) && printf '%s INFO  %s\n' "$(iso_date)" $1
}
function warn() {
  (( log_level <= 3 )) && printf '%s WARN  %s\n' "$(iso_date)" $1
}
function error() {
  (( log_level <= 4 )) && printf '%s ERROR %s\n' "$(iso_date)" $1
}

log_level=2

# =============================
# POWERLEVEL10K INSTANT PROMPT
# =============================

debug 'powerlevel10k instant prompt'

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# =============================
# POWERLEVEL10K
# =============================

debug 'powerlevel10k'

# TODO does this need to go at the bottom? used to be at the bottom...
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# =============================
# MACOS
# =============================

debug 'if macos, init path'
if [[ -f /usr/libexec/path_helper ]]; then
  eval `/usr/libexec/path_helper -s`
fi

# =============================
# ZINIT
# =============================

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

debug 'Install zinit if not found'
if [[ ! -f "$ZINIT_HOME/zinit.zsh" ]]; then
  bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
fi

debug 'zinit'
source "$ZINIT_HOME/zinit.zsh"

# =============================
# PLUGINS
# =============================

debug 'zinit basic plugins'
zinit load zdharma/history-search-multi-word
zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting

debug 'zinit completion'
zinit light zsh-users/zsh-completions
zinit light gradle/gradle-completion

# =============================
# THEME
# =============================

debug 'zinit theme'
zinit ice depth=1
zinit light romkatv/powerlevel10k

# =============================
# CUSTOM SCRIPTS
# =============================

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

# =============================
# MORE COMPLETIONS
# =============================

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
source "$HOME"/.fzf/fzf-options.sh
source "$HOME"/.fzf/fzf.zsh

debug 'direnv completions'
eval "$(direnv hook zsh)"

debug 'nodenv completions'
eval "$(nodenv init -)" # End of Zinit's installer chunk

debug 'sdkman'
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/sebastian/.sdkman"
[[ -s "/Users/sebastian/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/sebastian/.sdkman/bin/sdkman-init.sh"

debug 'ng completions'
if [ $commands[ng] ]; then
    source <(ng completion script)
fi

debug 'done'
