is_interactive_shell || return

## Initilialize pyenv
if is_installed pyenv; then
    eval "$(pyenv init -)"
fi

function penv {
    echo "# python"
    python --version
    which python
    which pip
    echo "# python3"
    python3 --version
    which python3
    which pip3
    echo
    echo "VIRTUAL_ENV=${VIRTUAL_ENV:-none}"
}
