umask 077
mesg n


is_interactive_shell || return

## automatically exit shell if idle $TMOUT seconds
# export TMOUT=1800

## ignore Ctrl-d $IGNOREEOF times before exiting the shell
export IGNOREEOF=3

## suffixes to ignore on filename completion
# export FIGNORE='~'

## input history
export HISTSIZE=8192
export HISTIGNORE='ls: *:&'
export HISTFILESIZE=8192

# Shell options
set -o noclobber
set -o notify

shopt -s cdspell        # correct minor errors in directory spelling
shopt -s checkhash
shopt -s checkwinsize
shopt -s cmdhist        # save multi-line commands in single history entries
shopt -s extglob
shopt -s histappend
shopt -s histreedit
shopt -s histverify     # don't immediately run history substitutions
shopt -s lithist        # save newlines in history for multi-line commands,
                        # very handy together with the fc builtin
shopt -s no_empty_cmd_completion
shopt -s promptvars

shopt -u huponexit
shopt -u mailwarn
shopt -u sourcepath

# Bash 4.0
if [ $BASH_VERSINFO -ge 4 ]; then
    shopt -s checkjobs      # confirm shell exit if jobs are running
fi
