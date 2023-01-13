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
alias doco="docker compose"

# kubernetes
alias kc="kubectl"

# X Windows
alias clip="xclip -selection clipboard"

# Gradle
alias gr="gradle"
alias gw="./gradlew"

# Git
alias gst="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias ga="git add"
alias gaa="git add --all"
alias gc="git commit"
alias gco="git checkout"
alias gcm='git checkout $(git rev-parse --abbrev-ref origin/HEAD | sed "s/origin\///")'
alias gl="git log --graph --all --oneline --decorate"
alias gf="git fetch"
alias gpl="git pull"
alias gpu="git push"
alias gput="git push --set-upstream origin \$(git branch --show-current)"
alias gm="git merge"
alias gb="git branch"
alias grb="git rebase"
alias gnope="git checkout ."
alias gwait="git reset HEAD"
alias gundo="git reset --soft HEAD^"
# source: https://stackoverflow.com/a/33548037
alias grmgone="git fetch -p && for branch in \$(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '\$2 == \"[gone]\" {sub(\"refs/heads/\", \"\", \$1); print \$1}'); do git branch -D \$branch; done"

# kubectx
alias kcx="kubectx"
alias kns="kubens"
