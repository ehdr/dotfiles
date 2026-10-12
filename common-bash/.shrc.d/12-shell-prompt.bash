is_interactive_shell || return

# $1: status of previous command
prompt_character() {
    local last_status=$1
    local character='$'
    local color=""
    local reset_color="\[$(tput sgr0)\]"

    if [ -n "$LOGNAME" -a "$LOGNAME" = "$(whoami)" ]; then
        color="\[$(tput setaf 6)\]" # cyan
    elif [ -n "$USER" -a "$USER" = "root" ]; then
        color="\[$(tput setaf 4)\]" # blue
        character='#'
    else
        color="\[$(tput setaf 5)\]" # magenta
    fi

    if [ "$last_status" != "0" ]; then
        color="\[$(tput setaf 1)\]" #red
    fi

    if is_color_capable_shell; then
        echo "$color$character$reset_color"
        return
    fi
    echo "$character"
}

dynamic_prompt() {
    last_status=$?
    echo "$debian_chroot$(pwd_tail)$(git_stashes)$(prompt_character $last_status)"
}

export PROMPT_COMMAND='PS1="$(dynamic_prompt) "'
export PS1
