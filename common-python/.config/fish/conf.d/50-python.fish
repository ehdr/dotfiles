# Initialize pyenv
if is_installed pyenv
    set -gx PYENV_ROOT "$HOME/.pyenv"
    fish_add_path "$PYENV_ROOT/bin"
end

is_interactive_shell; or return

set -gx PIP_REQUIRE_VIRTUALENV true

# Initialize pyenv for interactive shells
if is_installed pyenv
    pyenv init - | source
end

if is_installed uv
    abbr -a pip 'uv pip'
end

function penv
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
    echo "VIRTUAL_ENV="(set -q VIRTUAL_ENV; and echo $VIRTUAL_ENV; or echo "none")
end
