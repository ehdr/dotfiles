is_installed /opt/homebrew/bin/brew; or return

eval (/opt/homebrew/bin/brew shellenv)
set -gx HOMEBREW_PREFIX /opt/homebrew
set -gx HOMEBREW_CASK_OPTS "--appdir=$HOME/Applications"
set -gx HOMEBREW_NO_SUDO 1

is_interactive_shell; or return

set -gx HOMEBREW_NO_AUTO_UPDATE 1
