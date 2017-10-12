# shell customizations (before)
if [ -f ~/.shell_local_before ]; then
    source ~/.shell_local_before
fi

# zshrc customizations (before)
if [ -f ~/.zshrc_local_before ]; then
    source ~/.zshrc_local_before
fi

# shell settings
source ~/.shell/settings.zsh

# aliases
source ~/.shell/aliases.sh

# zsh settings
source ~/.zsh/settings.zsh

# zplug
source ~/.zsh/zplug.zsh

# shell customizations (after)
if [ -f ~/.shell_local_after ]; then
    source ~/.shell_local_after
fi

# zshrc customizations (after)
if [ -f ~/.zshrc_local_after ]; then
    source ~/.zshrc_local_after
fi
