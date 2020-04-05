export TERM_COLOR_ENABLED=false
if [ -t 1 ]; then
    ncolors=$(tput colors)
    if test -n "$ncolors" && test $ncolors -ge 8; then
        TERM_COLOR_ENABLED=true
    fi
fi

function is_color_capable_shell() {
    [ "$TERM_COLOR_ENABLED" == true ]
}

function is_interactive_shell() {
    [ -n "${PS1-}" ]
}

function is_installed() {
    command -v "$1" 2>&1 > /dev/null
}

function confirm() {
    read -p "${*:-OK?} [y/N] " -r
    case "$REPLY" in
      y|Y) return 0 ;;
    esac
    return 1
}

function path_prepend() {
    if [ -z "$2" ]; then
        >&2 cat <<EOF

Usage: path_prepend <PATH value> <path to prepend>

Example:
$ PATH=/a:/b/c:/d
$ path_prepend \$PATH /e
/e:/a:/b/c:/d
$ path_prepend \$PATH /d
/d:/a:/b/c

Warning: Does not handle paths containing newlines
EOF
        return 1
    fi

    local p=$(path_remove "$1" "$2")
    echo "$2${p:+":$p"}"
}

function path_remove() {
    if [ -z "$2" ]; then
        >&2 cat <<EOF

Usage: path_remove <PATH value> <path to remove>

Example:
$ PATH=/a:/b/c:/d
$ path_remove \$PATH /d
/a:/b/c
$ path_remove \$PATH /e
/a:/b/c:/d

Warning: Does not handle paths containing newlines
EOF
        return 1
    fi

    local p=$(echo "$1" | tr ":" "\n" | grep -v "^$2\$" | tr "\n" ":")
    echo ${p%:}
}

function df_confirm() {
    read -p "${1:-'Ok?'} [y/N] " yn
    case $yn in
        [Yy]*) return 0; ;;
        *) return 1 ;;
    esac
}
