is_interactive_shell || return

for util in coreutils findutils grep gawk gnu-sed gnu-tar gnu-indent gnu-which; do
    util_path="$(brew --prefix)/opt/${util}/libexec"
    bin_dir="$util_path/gnubin"
    if [ ! -d "$bin_dir" ]; then
        df_error "macos-homebrew: failed to find $util - not adding to \$PATH"
    else
        PATH=$(path_prepend "$PATH" "$bin_dir")
    fi

    man_dir="$util_path/gnuman"
    if [ -d "$man_dir" ]; then
        MANPATH=$(path_prepend "$MANPATH" "$man_dir")
    fi
done

for util in man-db; do
    util_path="$(brew --prefix)/opt/${util}/libexec"
    bin_dir="$util_path/bin"
    if [ ! -d "$bin_dir" ]; then
        df_error "macos-homebrew: failed to find $util - not adding to \$PATH"
    else
        PATH=$(path_prepend "$PATH" "$bin_dir")
    fi

    man_dir="$util_path/man"
    if [ -d "$man_dir" ]; then
        MANPATH=$(path_prepend "$MANPATH" "$man_dir")
    fi
done


for util in curl gnu-getopt; do
    util_path="$(brew --prefix)/opt/${util}"
    bin_dir="$util_path/bin"
    if [ ! -d "$bin_dir" ]; then
        df_error "macos-homebrew: failed to find ${util} - not adding to \$PATH"
    else
        PATH=$(path_prepend "$PATH" "$bin_dir")
    fi

    man_dir="$util_path/share/man"
    if [ -d "$man_dir" ]; then
        MANPATH=$(path_prepend "$MANPATH" "$man_dir")
    fi
done
unset util util_path bin_dir man_dir
