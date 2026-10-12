for f in ~/.shrc.d/*.(sh|zsh)(N); do
    [ -r "$f" ] && source "$f"
done
