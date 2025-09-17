is_interactive_shell || return
is_installed zoxide || return

eval "$(zoxide init --cmd cd bash)"
