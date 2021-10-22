export PATH
export MANPATH

for dir in bin .local/bin; do
    [ -d "$HOME/$dir" ] && PATH=$(path_prepend "$PATH" "$HOME/$dir")
done

for dir in man .local/man; do
    [ -d "$HOME/$dir" ] && MANPATH=$(path_prepend "$MANPATH" "$HOME/$dir")
done