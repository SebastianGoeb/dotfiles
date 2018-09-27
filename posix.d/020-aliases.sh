# grep
alias grep="grep --color"

# ls
case "$OSTYPE" in
    bsd*)       alias ls="ls -G" ;;
    darwin*)    alias ls="ls -G" ;;
    *)          alias ls="ls --color" ;;
esac
alias la="ls -A"
alias l="ls -lh"
alias ll="ls -lah"

# docker
alias doco="docker-compose"

# kubernetes
alias kc="kubectl"

# X Windows
alias clip="xclip -selection clipboard"
