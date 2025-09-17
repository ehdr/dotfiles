is_interactive_shell || return
is_installed tmux || return

alias tmux='tmux -f ~/.tmux-macos.conf'

is_installed reattach-to-user-namespace || df_error 'macos-tmux: warning! reattach-to-user-namespace not installed'
