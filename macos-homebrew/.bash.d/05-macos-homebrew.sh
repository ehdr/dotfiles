is_installed /opt/homebrew/bin/brew || return

eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_PREFIX=/opt/homebrew

is_interactive_shell || return

if is_installed brew && [ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ] && ! shopt -oq posix; then
  source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
fi

export HOMEBREW_NO_AUTO_UPDATE=1
