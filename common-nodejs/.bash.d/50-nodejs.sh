is_installed fnm && eval "$(fnm env --shell bash)"

is_interactive_shell || return

is_installed fnm && eval "$(fnm env --use-on-cd --shell bash)"
