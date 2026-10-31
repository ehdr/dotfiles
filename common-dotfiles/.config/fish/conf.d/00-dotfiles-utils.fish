function is_installed
    type -q $argv[1]
end

function df_flag
    set -l default $argv[2]
    set -q default[1]; or set default true
    set -l value $default
    set -q $argv[1]; and set value $$argv[1]
    switch "$value"
        case true
            return 0
        case false
            return 1
    end
    df_error "$argv[1]: expected true or false, got '$value'"
    test "$default" = true
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
