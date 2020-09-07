# visual editor
export VISUAL="vim"

# line editor
export EDITOR="vim"

# language
export LANG="en_GB.UTF-8"
export LC_ALL="en_GB.UTF-8"

# User Binaries
export PATH="$PATH:$HOME/.bin"

stopwatch() {
    date1=`date +%s`; while true; do
        echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
    done
}
