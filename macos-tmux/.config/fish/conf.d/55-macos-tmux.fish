is_interactive_shell; or return
is_installed tmux; or return

abbr -a tmux 'tmux -f ~/.tmux-macos.conf'

if not is_installed reattach-to-user-namespace
    df_error 'macos-tmux: warning! reattach-to-user-namespace not installed'
end
