is_interactive_shell || return

## Initilialize ruby environment
if is_installed rbenv; then
    eval "$(rbenv init -)"
fi
