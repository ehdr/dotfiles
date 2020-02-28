is_interactive_shell || return

is_installed direnv || return
eval "$(direnv hook bash)"
