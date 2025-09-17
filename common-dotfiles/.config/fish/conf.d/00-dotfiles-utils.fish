function is_installed
    type -q $argv[1]
end

function is_interactive_shell
    status is-interactive
end

function df_log
    echo "dotfiles: $argv"
end

function df_error
    echo "dotfiles error: $argv" >&2
end
