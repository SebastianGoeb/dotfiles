# grep
alias grep="grep --color"

# ls
case "$OSTYPE" in
    bsd*)       alias ls="ls -G" ;;
    darwin*)    alias ls="ls -G" ;;
    *)          alias ls="ls --color" ;;
esac
alias la="ls -A"
alias l="ls -lhr"
alias ll="ls -lah"

# git
alias gst="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias gaa="git add --all"
alias gc="git commit"
alias gco="git checkout"
alias gcm="git checkout master"
alias gl="git log --graph --all --oneline --decorate"
alias gf="git fetch"
alias gpl="git pull"
alias gpu="git push"
alias gm="git merge"
alias gb="git branch"

