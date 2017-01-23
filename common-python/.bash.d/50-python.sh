is_interactive_shell || return

## Initilialize ruby environment
if is_installed pyenv; then
    eval "$(pyenv init -)"
fi
