is_interactive_shell || return

# inspired by: http://frantic.im/notify-on-completion
function notify_after_long_running_command() {
    last_status=$?
    cmd=$(fc -ln -1)
    # no need to wait for the notify command to finish
    # also, run in (subshell) to prevent '[1]+  Done...' output
    # from shell job control
    (notify-long-runner-finished.sh "$cmd" "$last_status" &)
}

export PROMPT_COMMAND="notify_after_long_running_command; $PROMPT_COMMAND"
