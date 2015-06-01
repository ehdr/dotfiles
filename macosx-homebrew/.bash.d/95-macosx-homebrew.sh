PATH=$(path_prepend "$PATH" "/usr/local/sbin")
PATH=$(path_prepend "$PATH" "/usr/local/bin")


is_interactive_shell || return

if is_installed brew && [ -f $(brew --prefix)/etc/bash_completion ] && ! shopt -oq posix; then
  source $(brew --prefix)/etc/bash_completion
fi
