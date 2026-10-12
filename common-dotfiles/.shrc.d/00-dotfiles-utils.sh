if [ -n "${ZSH_VERSION-}" ]; then
    DF_SHELL=zsh
else
    DF_SHELL=bash
fi

export TERM_COLOR_ENABLED=false
if [ -t 1 ]; then
    ncolors=$(tput colors)
    if test -n "$ncolors" && test $ncolors -ge 8; then
        TERM_COLOR_ENABLED=true
    fi
    unset ncolors
fi

function is_color_capable_shell() {
    [ "$TERM_COLOR_ENABLED" = true ]
}

function is_interactive_shell() {
    case $- in
        *i*) return 0 ;;
    esac
    return 1
}

function is_installed() {
    command -v "$1" 2>&1 > /dev/null
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
EOF
        return 1
    fi

    local _df_path
    _df_path_remove "$1" "$2"
    printf '%s\n' "$2${_df_path:+":$_df_path"}"
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
EOF
        return 1
    fi

    local _df_path
    _df_path_remove "$1" "$2"
    printf '%s\n' "$_df_path"
}

# Sets $_df_path to $1 with every occurrence of $2 removed. Uses only parameter
# expansion, since spawning processes here made shell startup slow. Callers
# should declare _df_path local.
function _df_path_remove() {
    _df_path=":$1:"
    while :; do
        case "$_df_path" in
            *:"$2":*) _df_path="${_df_path%%:"$2":*}:${_df_path#*:"$2":}" ;;
            *) break ;;
        esac
    done
    _df_path="${_df_path#:}"
    _df_path="${_df_path%:}"
}

function df_confirm() {
    printf '%s [y/N] ' "${1:-Ok?}"
    read yn
    case $yn in
        [Yy]*) return 0; ;;
    esac
    return 1
}

function df_log() {
    echo "dotfiles: $*"
}

function df_error() {
    echo "dotfiles error: $*" >&2
}
