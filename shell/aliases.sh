###########
# Aliases #
###########

# color
alias grep="grep --color"

# ls aliases
case "$OSTYPE" in
    bsd*)       alias ls="ls -G" ;;
    darwin*)    alias ls="ls -G" ;;
    *)          alias ls="ls --color" ;;
esac
alias la="ls -A"
alias l="ls -lhr"
alias ll="ls -lah"

# git aliases
alias gst="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias gaa="git add --all"
alias gc="git commit"
alias gco="git checkout"
alias gcm="git checkout master"
alias gl="git log --graph --all --oneline --decorate"
alias gpl="git pull"
alias gpu="git push"
