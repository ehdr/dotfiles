is_interactive_shell || return

if is_installed brew && [ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ] && ! shopt -oq posix; then
  source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
fi
