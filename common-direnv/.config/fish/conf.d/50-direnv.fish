is_interactive_shell; or return
is_installed direnv; or return

set -g direnv_fish_mode eval_on_arrow
direnv hook fish | source
