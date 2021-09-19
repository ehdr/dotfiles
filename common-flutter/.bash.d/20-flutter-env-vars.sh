is_interactive_shell || return

[ -d "$HOME/opt/flutter/bin" ] && PATH=$(path_prepend "$PATH" "$HOME/opt/flutter/bin")
