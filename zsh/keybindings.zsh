# generic
bindkey -e
bindkey "^[[A" history-substring-search-up # up
bindkey "^[[B" history-substring-search-down # down
bindkey "^[[2~" overwrite-mode # ins

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

# Linux
bindkey "^[OA" history-substring-search-up # up
bindkey "^[OB" history-substring-search-down # down

# IntelliJ on Linux
bindkey "^[O5D" backward-word # ctrl-left
bindkey "^[O5C" forward-word # ctrl-right
