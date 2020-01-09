is_interactive_shell || return

alias tmux='tmux -f ~/.tmux-macosx.conf'

is_installed reattach-to-user-namespace || df_error_message 'macosx-tmux: warning! reattach-to-user-namespace not installed'
