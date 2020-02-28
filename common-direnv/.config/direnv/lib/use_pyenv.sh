use_pyenv() {
  unset PYENV_VERSION

  local python_version=${1}
  local pyenv_python=$(pyenv root)/versions/${python_version}/bin/python
  if [[ ! -x "$pyenv_python" ]]; then
    log_error "Error: $pyenv_python can't be executed."
    return 1
  fi

  unset PYTHONHOME
  local ve=$($pyenv_python -c "import pkgutil; print('venv' if pkgutil.find_loader('venv') else ('virtualenv' if pkgutil.find_loader('virtualenv') else ''))")

  case $ve in
    "venv")
      VIRTUAL_ENV=$(direnv_layout_dir)/python-$python_version
      export VIRTUAL_ENV
      if [[ ! -d $VIRTUAL_ENV ]]; then
        $pyenv_python -m venv "$VIRTUAL_ENV"
      fi
      PATH_add "$VIRTUAL_ENV"/bin
      ;;
    "virtualenv")
      layout_python "$pyenv_python"
      ;;
    *)
      log_error "Error: neither venv nor virtualenv are available to ${pyenv_python}."
      return 1
      ;;
  esac

  export PYENV_VERSION=$python_version
}

