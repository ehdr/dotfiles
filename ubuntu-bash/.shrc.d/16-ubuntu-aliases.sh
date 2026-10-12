is_interactive_shell || return

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
# borrowed from Ubuntu's default .bashrc, requires package 'libnotify-bin'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
