is_installed /opt/homebrew/bin/brew; or return

eval (/opt/homebrew/bin/brew shellenv)
set -gx HOMEBREW_PREFIX /opt/homebrew

is_interactive_shell; or return

set -gx HOMEBREW_NO_AUTO_UPDATE 1
