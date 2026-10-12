set -gx npm_config_min_release_age 7

is_installed fnm; or return

if is_interactive_shell
    fnm env --use-on-cd --shell fish | source
else
    fnm env --shell fish | source
end
