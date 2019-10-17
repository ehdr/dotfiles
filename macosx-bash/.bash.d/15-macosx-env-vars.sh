## Set up PATH for Xcode utilities
PATH=$(path_prepend "$PATH" "/Applications/Xcode.app/Contents/Developer/usr/bin")

is_interactive_shell || return

export CLICOLOR=1
