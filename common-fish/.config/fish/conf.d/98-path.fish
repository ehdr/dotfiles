for dir in bin .local/bin
    test -d "$HOME/$dir"; and fish_add_path "$HOME/$dir"
end

for dir in man .local/man
    if test -d "$HOME/$dir"
        set -gx MANPATH "$HOME/$dir" "$MANPATH"
    end
end
