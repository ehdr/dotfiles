is_installed /opt/homebrew/bin/brew || return

eval "$(/opt/homebrew/bin/brew shellenv $DF_SHELL)"
export HOMEBREW_PREFIX=/opt/homebrew

is_interactive_shell || return

export HOMEBREW_NO_AUTO_UPDATE=1
