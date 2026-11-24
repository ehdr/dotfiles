is_interactive_shell || return

# $1: status of previous command
prompt_character() {
    local last_status=$1
    local character='$'
    local color

    if [ -n "$LOGNAME" -a "$LOGNAME" = "$(whoami)" ]; then
        color=6 # cyan
    elif [ -n "$USER" -a "$USER" = "root" ]; then
        color=4 # blue
        character='#'
    else
        color=5 # magenta
    fi

    if ! is_color_capable_shell; then
        echo "$character"
        return
    fi

    if [ "$last_status" != "0" ]; then
        color=1 # red
    fi

    printf '\\[%s\\]%s\\[%s\\]\n' "$(tput setaf "$color")" "$character" "$(tput sgr0)"
}

dynamic_prompt() {
    last_status=$?
    echo "$debian_chroot$(pwd_tail)$(git_stashes)$(prompt_character $last_status)"
}

export PROMPT_COMMAND='PS1="$(dynamic_prompt) "'
export PS1
