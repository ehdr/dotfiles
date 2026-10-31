is_installed /opt/homebrew/bin/brew; or return
df_flag DF_HOMEBREW_PATH_OVERRIDES; or return

# Collected and added with a single fish_add_path call at the end, since each
# call is slow. Prepended, so that later utils take precedence as before.
set -l bin_dirs

for util in coreutils findutils grep gawk gnu-sed gnu-tar gnu-indent gnu-which
    set -l util_path "$HOMEBREW_PREFIX/opt/$util/libexec"

    set -l bin_dir "$util_path/gnubin"
    if not test -d "$bin_dir"
        echo "macos-homebrew: failed to find $util - not adding to \$PATH" >&2
    else
        set -p bin_dirs "$bin_dir"
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
        set -p bin_dirs "$bin_dir"
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
        set -p bin_dirs "$bin_dir"
    end

    set -l man_dir "$util_path/share/man"
    if test -d "$man_dir"
        set -gx MANPATH "$man_dir" "$MANPATH"
    end
end

set -q bin_dirs[1]; and fish_add_path -g $bin_dirs
