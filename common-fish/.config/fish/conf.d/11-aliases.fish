is_interactive_shell; or return

abbr -a rm 'rm -i'
abbr -a mv 'mv -i'
abbr -a cp 'cp -i'

abbr -a ppath 'printf "%s\n" $PATH'

abbr -a reload_shell 'exec fish'

abbr -a l. 'ls -d .*'

# grep aliases with color support
abbr -a fgrep 'fgrep --color=auto'
abbr -a egrep 'egrep --color=auto'
