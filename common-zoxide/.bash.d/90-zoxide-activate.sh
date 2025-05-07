is_interactive_shell || return

if is_installed zoxide; then
    eval "$(zoxide init --cmd cd bash)"
fi
