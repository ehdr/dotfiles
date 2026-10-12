is_interactive_shell || return
is_installed fzf || return

eval "$(fzf --$DF_SHELL)"
