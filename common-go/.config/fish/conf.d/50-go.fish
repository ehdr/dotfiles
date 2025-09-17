if test -d "$HOME/go"
    set -gx GOPATH "$HOME/go"

    if test -d "$GOPATH/bin"
        fish_add_path "$GOPATH/bin"
    end
end
