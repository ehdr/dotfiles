for f in ~/.bash.d/*.sh; do
    [ -r "$f" ] && source "$f"
done
