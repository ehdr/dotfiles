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

git_stashes() {
    local stashes="$(git stash list 2>/dev/null | wc -l)"
    if [ "$stashes" -gt 0 ]; then
        echo " (git stashes: $stashes)"
    fi
}
