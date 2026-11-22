if [ -d "$HOME/.docker/bin" ]; then
    PATH=$(path_prepend "$PATH" "$HOME/.docker/bin")
fi

if [ -d "$HOME/.docker/run" ]; then
    export DOCKER_HOST="unix://$HOME/.docker/run/docker.sock"
fi
