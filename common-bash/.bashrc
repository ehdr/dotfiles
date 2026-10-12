for f in ~/.shrc.d/*; do
    case "$f" in
        *.sh|*.bash) [ -r "$f" ] && source "$f" ;;
    esac
done
