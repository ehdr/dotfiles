is_interactive_shell || return

for util in coreutils findutils grep gawk gnu-sed gnu-tar gnu-indent gnu-which; do
    util_path="$(brew --prefix)/opt/${util}/libexec/gnubin"
    if [ ! -d "$util_path" ]; then
        df_error "macos-gnuutils: failed to find $util - not adding to \$PATH"
    else
        PATH=$(path_prepend "$PATH" "$util_path")
    fi
done

for util in gnu-getopt curl; do
    util_path="$(brew --prefix)/opt/${util}/bin"
    if [ ! -d "$util_path" ]; then
        df_error "macos-gnuutils: failed to find ${util} - not adding to \$PATH"
    else
        PATH=$(path_prepend "$PATH" "$util_path")
    fi
done
unset util util_path
