is_interactive_shell; or return

## EDITOR
if is_installed vim
    set -gx EDITOR vim
else if is_installed vi
    set -gx EDITOR vi
else if is_installed nano
    set -gx EDITOR nano
end
set -gx VISUAL "$EDITOR"

## PAGERS
if is_installed bat
    set -gx PAGER "bat"
else if is_installed less
    set -gx PAGER "less"
end
if is_installed zless
    set -gx ZPAGER "zless"
end
