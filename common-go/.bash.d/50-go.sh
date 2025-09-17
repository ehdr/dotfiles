if [ -d "$HOME/go" ]; then
    export GOPATH="$HOME/go"

    if [ -d "$GOPATH/bin" ]; then
        PATH=$(path_prepend "$PATH" "$GOPATH/bin")
    fi
fi
