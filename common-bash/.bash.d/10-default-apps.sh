is_interactive_shell || return

## EDITOR
if is_installed vim; then
    EDITOR=vim
elif is_installed vi; then
    EDITOR=vi
elif is_installed nano; then
    EDITOR=nano
fi
export EDITOR
export VISUAL="$EDITOR"

## PAGERS
if is_installed bat; then
    export PAGER="bat"
elif is_installed less; then
    export PAGER="less"
fi
if is_installed zless; then
    export ZPAGER="zless"
fi
