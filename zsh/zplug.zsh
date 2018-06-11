#######################
# Zplug Configuration #
#######################

# ZPLUG_HOME might be different depending on installation type (script/homebrew)
case "$OSTYPE" in
    darwin*)    export ZPLUG_HOME=/usr/local/opt/zplug ;;
    *)          export ZPLUG_HOME=~/.zplug ;;
esac

# Remove zplug from fpath, otherwise zplug env vars from parent zsh might break child zsh
tmp=()
for el in $fpath; do
    ! [[ $el =~ 'zplug' ]] && tmp+=($el)
done
export fpath=($tmp)
unset tmp

# setup zplug
if [[ -v ZPLUG_HOME ]]; then
    if [[ -f $ZPLUG_HOME/init.zsh ]]; then
        # initialize zplug
        source $ZPLUG_HOME/init.zsh

        if ( command -v zplug &> /dev/null ); then
            # credit: https://terriblecode.com/blog/zplug-from-a-former-oh-my-zsh-user/
            # async for zsh, used by pure
            zplug "mafredri/zsh-async", from:github, defer:0
            # pure theme
            zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
            # syntax highlighting for commands, load last (defer)
            zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:3
            export HISTORY_SUBSTRING_SEARCH_FUZZY="true"
            # partial match history entries
            zplug "zsh-users/zsh-history-substring-search"

            # install plugins if there are plugins that have not been installed
            if ! zplug check --verbose; then
                printf "Install missing zplug plugins? [y/N]: "
                if read -q; then
                    echo; zplug install
                fi
            fi

            # finally, source plugins and add commands to $PATH
            zplug load
        else
            echo "Unable to initialize zplug. Found $ZPLUG_HOME/init.zsh but zplug command was not registered" >&2
        fi
    else
        echo "Unable to initialize zplug. Can't find $ZPLUG_HOME/init.zsh" >&2
    fi
else
    echo "Unable to initialize zplug. \$ZPLUG_HOME not defined" >&2
fi
