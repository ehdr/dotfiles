export npm_config_min_release_age=7

is_installed fnm || return

if is_interactive_shell; then
    eval "$(fnm env --use-on-cd --shell $DF_SHELL)"
else
    eval "$(fnm env --shell $DF_SHELL)"
fi
