is_installed fnm; and fnm env --shell fish | source

set -gx npm_config_min_release_age 7

is_interactive_shell; or return

is_installed fnm; and fnm env --use-on-cd --shell fish | source
