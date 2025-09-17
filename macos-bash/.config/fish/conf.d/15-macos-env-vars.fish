fish_add_path "/Applications/Xcode.app/Contents/Developer/usr/bin"

is_interactive_shell; or return

if not is_installed gls
    # Enable colorized output for BSD ls
    set -g LS_COLOR_FLAG "-G"
end

set -gx CLICOLOR 1
set -gx BASH_SILENCE_DEPRECATION_WARNING 1
