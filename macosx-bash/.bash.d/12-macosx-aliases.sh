is_interactive_shell || return

# for interactive shells, replace some BSD utils with GNU variants
if is_installed gls; then
    alias ls_executable=gls
else
    # "Enable colorized output" for BSD ls
    LS_COLOR_FLAG="-G"
fi
is_installed gdircolors && alias dircolors=gdircolors

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='tput bel'

alias mdfindh='mdfind -onlyin .'
