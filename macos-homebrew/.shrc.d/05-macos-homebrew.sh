is_installed /opt/homebrew/bin/brew || return

eval "$(/opt/homebrew/bin/brew shellenv $DF_SHELL)"
export HOMEBREW_PREFIX=/opt/homebrew
