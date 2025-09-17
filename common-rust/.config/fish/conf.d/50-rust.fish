if test -d "$HOME/.cargo"
    set -gx CARGO_HOME "$HOME/.cargo"
    fish_add_path "$CARGO_HOME/bin"
end
