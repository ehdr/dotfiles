is_interactive_shell; or return
is_installed tmux; or return

if not test -d ~/.tmux/plugins/tpm
    df_log "common-tmux: tmux tpm is not installed - run ~/dotscripts/init-tmux"
end

abbr -a tmux0 'tmux new -A -s 0'
