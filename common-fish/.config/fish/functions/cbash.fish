function cbash --description 'Run a command in a clean bash shell'
    if test (count $argv) -gt 0
        env -i HOME="$HOME" USER="$USER" PATH="/usr/local/bin:/usr/bin:/bin" TERM="$TERM" bash --login -i -c "eval \"\$(direnv export bash)\"; $argv"
    else
        env -i HOME="$HOME" USER="$USER" PATH="/usr/local/bin:/usr/bin:/bin" TERM="$TERM" bash --login -i -c "eval \"\$(direnv export bash)\""
    end
end
