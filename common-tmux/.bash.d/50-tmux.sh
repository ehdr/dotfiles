is_interactive_shell || return

is_installed tmux || return

if [ ! -d ~/.tmux/plugins/tpm ]; then
    df_log "common-tmux: tmux tpm is not installed - run ~/dotscripts/init-tmux"
fi

alias tmux0='tmux new -A -s 0'
