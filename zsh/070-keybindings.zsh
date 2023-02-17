# generic
bindkey -e
bindkey "^[[2~" overwrite-mode # ins
bindkey -M menuselect "^[[Z" reverse-menu-complete # shift + tab

# macOS
bindkey "^[^[[D" backward-word # alt + left
bindkey "^[^[[C" forward-word # alt + right
bindkey "^[OH" beginning-of-line # cmd + left ?
bindkey "^[OF" end-of-line # cmd + right ?

# Windows
bindkey "^[[1;5D" backward-word # ctrl + left
bindkey "^[[1;5C" forward-word # ctrl + right
bindkey "^[[H" beginning-of-line # home
bindkey "^[[F" end-of-line # end
bindkey "^[[3~" delete-char # del

# IntelliJ on Linux
bindkey "^[O5D" backward-word # ctrl-left
bindkey "^[O5C" forward-word # ctrl-right
