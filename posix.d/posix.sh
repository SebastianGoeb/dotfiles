# ~/.bin
export PATH="$PATH:$HOME/.bin"


# nvm
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
    . "$NVM_DIR/nvm.sh"
else
    echo "nvm not installed"
fi


# editor
export VISUAL="vim"
export EDITOR="vim"


# language
export LANG="en_GB.UTF-8"
export LC_ALL="en_GB.UTF-8"

# utils
stopwatch() {
    date1=`date +%s`; while true; do
        echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
    done
}


# colored output
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
case "$OSTYPE" in
    bsd*|darwin*) alias ls="ls -G" ;;
    *)            alias ls="ls --color" ;;
esac


# shortcuts
alias la="ls -A"
alias l="ls -lh"
alias ll="ls -lah"

alias doco="docker-compose"

alias gst="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias ga="git add"
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
alias grb="git rebase"
alias gnope="git checkout ."
alias gwait="git reset HEAD"
alias gundo="git reset --soft HEAD^"
alias gprune="git branch --merged master | grep -v '^[ *]*master$' | xargs git branch -d"
