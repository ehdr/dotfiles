is_interactive_shell; or return
is_installed docker; or return

if ! test -e ~/.config/fish/completions/docker.fish
    docker completion fish > ~/.config/fish/completions/docker.fish
end
