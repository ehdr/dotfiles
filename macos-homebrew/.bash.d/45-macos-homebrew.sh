if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

is_interactive_shell || return

if is_installed brew && [ -f $(brew --prefix)/etc/bash_completion ] && ! shopt -oq posix; then
  source $(brew --prefix)/etc/bash_completion
fi

export HOMEBREW_NO_AUTO_UPDATE=1
