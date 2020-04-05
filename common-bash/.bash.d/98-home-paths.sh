export PATH
export MANPATH

[ -d "$HOME/bin" ] && PATH=$(path_prepend "$PATH" "$HOME/bin")
[ -d "$HOME/man" ] && MANPATH=$(path_prepend "$MANPATH" "$HOME/man")
