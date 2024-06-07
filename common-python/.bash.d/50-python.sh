## Initilialize pyenv
if is_installed pyenv; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
fi


is_interactive_shell || return

export PIP_REQUIRE_VIRTUALENV=true

## Initilialize pyenv for interactive shells
if is_installed pyenv; then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi

if is_installed uv; then
    alias pip='uv pip'
fi

function penv {
    echo "# python"
    python --version
    which python
    which pip
    which uv
    echo "# python3"
    python3 --version
    which python3
    which pip3
    echo
    echo "VIRTUAL_ENV=${VIRTUAL_ENV:-none}"
}
