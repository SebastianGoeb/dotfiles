export FZF_DEFAULT_OPTS=""
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --height=100%"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --preview=\"printf '%s' {}\""
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --preview-window=down:50%:wrap"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --bind='ctrl-p:toggle-preview'"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --prompt='fzf>'"

export FZF_DEFAULT_COMMAND="rg --files 2>/dev/null"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
