# MUST be executed before zsh-syntax-highlighting plugin (zplug.zsh)

# delete partial words with ^W
autoload -U select-word-style
select-word-style bash
