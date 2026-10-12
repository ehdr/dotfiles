is_interactive_shell || return

# dircolors
if is_installed dircolors; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
