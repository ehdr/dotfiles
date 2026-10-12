is_interactive_shell || return
is_installed aws_completer || return

## Amazon AWS CLI
complete -C aws_completer aws
