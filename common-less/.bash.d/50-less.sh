is_interactive_shell || return

export LESS='-iMqRS -j4'
export LESSCHARSET='utf-8'

# make less more friendly for non-text input files, see lesspipe(1)
is_installed lesspipe && eval "$(SHELL=/bin/sh lesspipe)"
