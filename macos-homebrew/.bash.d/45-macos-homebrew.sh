if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

is_interactive_shell || return

if is_installed brew && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ] && ! shopt -oq posix; then
  source "$(brew --prefix)/etc/profile.d/bash_completion.sh"
fi

export HOMEBREW_NO_AUTO_UPDATE=1
