if [ -d "$HOME/.cargo" ]; then
    export CARGO_HOME="$HOME/.cargo"
    PATH=$(path_prepend "$PATH" "$CARGO_HOME/bin")
fi
