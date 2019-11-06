is_interactive_shell || return

cenv () {
  if [ -z "$*" ]; then
    conda info --envs
  elif [ "$*" = "-d" ]; then
    conda deactivate
  else
    conda activate $*
  fi
}
