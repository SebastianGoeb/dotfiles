#######################
# Zplug Configuration #
#######################

case "$OSTYPE" in
  darwin*)  export ZPLUG_HOME="/usr/local/opt/zplug" ;;
  *)        export ZPLUG_HOME="~/.zplug" ;;
esac

if [[ -v ZPLUG_HOME ]]; then
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
        echo "zplug not installed"
    fi
else
    echo "zplug home not defined"
fi
