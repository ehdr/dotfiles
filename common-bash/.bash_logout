## Clear terminal on exit
if [ -z "$SHLVL" -o "$SHLVL" -eq 1 ]; then
    clear
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
