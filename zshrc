# generic
source ~/.shell/nvm.sh
source ~/.shell/aliases.sh
source ~/.shell/misc.sh

# zsh specific
source ~/.zsh/backward-kill.zsh # MUST be executed before zsh-syntax-highlighting plugin (zplug.zsh)
source ~/.zsh/history.zsh
source ~/.zsh/misc.zsh
source ~/.zsh/zplug.zsh # MUST be executed before kubectl completion (completion.zsh)
source ~/.zsh/sdkman.zsh
source ~/.zsh/completion.zsh # MUST be executed before some of the keybindings (keybindings.zsh)
source ~/.zsh/keybindings.zsh
