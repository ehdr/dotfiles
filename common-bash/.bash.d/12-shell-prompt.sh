is_interactive_shell || return

# Ancient code, that I have gotten used to, and so haven't bothered changing...

# set variable identifying the chroot you work in (used in the prompt below)
# borrowed from Ubuntu's default /etc/bash.bashrc
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
debian_chroot="${debian_chroot:+($debian_chroot)}"

# Echo the last $maxlen chars of $PWD
pwd_tail () {
    local maxlen=${1:-24}
    local trunc_symbol=${2:-"..."}

    # if current dir name is longer than maxlen, increase maxlen
    local dir="${PWD##*/}"
    maxlen=$(( (maxlen < ${#dir}) ? ${#dir} : maxlen ))

    local tail="${PWD/#$HOME}"
    if [ "$PWD" != "$tail" ]; then
        tail="~$tail" # save space by replacing $HOME with '~'
    fi
    local offset=$(( ${#tail} - maxlen ))
    if [ ${offset} -gt 0 ]; then
        tail="${tail:$offset:$maxlen}"
        tail="${trunc_symbol}${tail}"
    fi
    echo "$tail"
}

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
    echo "$debian_chroot$(pwd_tail)$(prompt_character $last_status)"
}

export PROMPT_COMMAND='PS1="$(dynamic_prompt) "'
export PS1
