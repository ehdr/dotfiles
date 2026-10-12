is_installed fnm && eval "$(fnm env --shell bash)"

export npm_config_min_release_age=7

is_interactive_shell || return

is_installed fnm && eval "$(fnm env --use-on-cd --shell bash)"
