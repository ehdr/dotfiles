if test -x /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
end

is_interactive_shell; or return

set -gx HOMEBREW_NO_AUTO_UPDATE 1
