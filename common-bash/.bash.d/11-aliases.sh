is_interactive_shell || return

alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

alias h=history
alias j=jobs

alias path='echo -e ${PATH//:/\\n}'

alias reload_shell='exec -l "$SHELL"'

alias ls_executable=ls
#alias e='$EDITOR'
#alias m='mutt'
#alias p='$PAGER'
#alias zp='$ZPAGER'
#alias w='$BROWSER'

LS_COLOR_FLAG='--color=auto'
LS_OPTIONS='-Fh $LS_COLOR_FLAG'
alias ls="ls_executable $LS_OPTIONS"
alias ll="ls_executable $LS_OPTIONS -l"
alias la="ls_executable $LS_OPTIONS -A"
alias laa="ls_executable $LS_OPTIONS -a"
alias lla="ls_executable $LS_OPTIONS -lA"
alias llaa="ls_executable $LS_OPTIONS -la"

GREP_OPTIONS='--color=auto'
alias grep="grep $GREP_OPTIONS"
alias fgrep="fgrep $GREP_OPTIONS"
alias egrep="egrep $GREP_OPTIONS"

alias wget='wget -c' # continue getting partially-downloaded files

alias edf='$EDITOR ~/.dotfiles'
alias rldf='exec -l $SHELL'
