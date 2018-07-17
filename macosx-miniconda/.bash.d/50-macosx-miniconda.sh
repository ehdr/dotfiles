is_interactive_shell || return

cenv () {
  if [ -z "$*" ]; then
    echo "CONDA_DEFAULT_ENV: ${CONDA_DEFAULT_ENV:-[none]}"
    conda info --envs
  elif [ "$*" = "-d" ]; then
    conda deactivate
  else
    conda activate $*
  fi
}
