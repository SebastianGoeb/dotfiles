# generic
source ~/.shell/nvm.sh
source ~/.shell/aliases.sh
source ~/.shell/misc.sh

# zsh specific

# MUST be executed before zsh-syntax-highlighting plugin (zplug.zsh)
source ~/.zsh/backward-kill.zsh
source ~/.zsh/history.zsh
source ~/.zsh/misc.zsh
# MUST be executed before kubectl completion (completion.zsh)
# zsh-syntax-highlighting says it must be imported after completions (compinit and zle -N), but it seems to work anyway???
source ~/.zsh/zplug.zsh
source ~/.zsh/sdkman.zsh
# MUST be executed before some of the keybindings (keybindings.zsh)
source ~/.zsh/completion.zsh
source ~/.zsh/keybindings.zsh
