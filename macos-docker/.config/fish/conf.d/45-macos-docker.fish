if test -d "$HOME/.docker/bin"
    fish_add_path -g "$HOME/.docker/bin"
end

if test -d "$HOME/.docker/run"
    set -gx DOCKER_HOST "unix://$HOME/.docker/run/docker.sock"
end
