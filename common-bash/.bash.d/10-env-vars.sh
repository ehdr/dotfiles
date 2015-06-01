export PATH
export MANPATH

[ -d "$HOME/bin" ] && PATH=$(path_prepend "$PATH" "$HOME/bin")
[ -d "$HOME/man" ] && MANPATH=$(path_prepend "$MANPATH" "$HOME/man")

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
