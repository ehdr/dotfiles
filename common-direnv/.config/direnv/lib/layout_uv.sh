# Pyhton uv support, from the [direnv wiki](https://github.com/direnv/direnv/wiki/Python#uv):
layout_uv() {
    if [[ -d ".venv" ]]; then
        VIRTUAL_ENV="$(pwd)/.venv"
    fi

    if [[ -z "${VIRTUAL_ENV:-}" || ! -d "${VIRTUAL_ENV:-}" ]]; then
        log_error "No virtual environment exists. Use \`uv init\` and \`uv venv\` to create one."
        exit 2
    fi

    PATH_add "$VIRTUAL_ENV/bin"
    export UV_ACTIVE=1  # or VENV_ACTIVE=1
    export VIRTUAL_ENV
}
