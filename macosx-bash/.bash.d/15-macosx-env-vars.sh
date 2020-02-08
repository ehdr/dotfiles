## Set up PATH for Xcode utilities
PATH=$(path_prepend "$PATH" "/Applications/Xcode.app/Contents/Developer/usr/bin")

is_interactive_shell || return

if ! is_installed gls; then
    # "Enable colorized output" for BSD ls
    LS_COLOR_FLAG="-G"
fi

export CLICOLOR=1

export BASH_SILENCE_DEPRECATION_WARNING=1
