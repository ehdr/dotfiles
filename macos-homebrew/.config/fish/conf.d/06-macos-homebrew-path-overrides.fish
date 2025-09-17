test -x /opt/homebrew/bin/brew; or return

for util in coreutils findutils grep gawk gnu-sed gnu-tar gnu-indent gnu-which
    set -l util_path "$HOMEBREW_PREFIX/opt/$util/libexec"

    set -l bin_dir "$util_path/gnubin"
    if not test -d "$bin_dir"
        echo "macos-homebrew: failed to find $util - not adding to \$PATH" >&2
    else
        fish_add_path "$bin_dir"
    end

    set -l man_dir "$util_path/gnuman"
    if test -d "$man_dir"
        set -gx MANPATH "$man_dir" "$MANPATH"
    end
end

for util in man-db
    set -l util_path "$HOMEBREW_PREFIX/opt/$util/libexec"
    set -l bin_dir "$util_path/bin"
    if not test -d "$bin_dir"
        echo "macos-homebrew: failed to find $util - not adding to \$PATH" >&2
    else
        fish_add_path "$bin_dir"
    end

    set -l man_dir "$util_path/man"
    if test -d "$man_dir"
        set -gx MANPATH "$man_dir" "$MANPATH"
    end
end

for util in curl gnu-getopt
    set -l util_path "$HOMEBREW_PREFIX/opt/$util"
    set -l bin_dir "$util_path/bin"
    if not test -d "$bin_dir"
        echo "macos-homebrew: failed to find $util - not adding to \$PATH" >&2
    else
        fish_add_path "$bin_dir"
    end

    set -l man_dir "$util_path/share/man"
    if test -d "$man_dir"
        set -gx MANPATH "$man_dir" "$MANPATH"
    end
end
