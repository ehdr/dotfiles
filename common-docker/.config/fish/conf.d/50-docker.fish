test -d "$HOME/.docker/bin"; and fish_add_path -g "$HOME/.docker/bin"

is_interactive_shell; or return
is_installed docker; or return

if ! test -e ~/.config/fish/completions/docker.fish
    docker completion fish > ~/.config/fish/completions/docker.fish
end
