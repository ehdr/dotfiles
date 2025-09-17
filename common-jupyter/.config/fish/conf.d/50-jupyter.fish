is_interactive_shell; or return

function jnb
    if test (count $argv) -eq 0
        jupyter notebook --notebook-dir=~
    else
        jupyter notebook $argv
    end
end
