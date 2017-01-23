is_interactive_shell || return

## Set up PATH for Anaconda miniconda Python distribution
# Actually, I prefer to have the "system" Python in PATH by default, and
# choose to use the conda ones only by explicitly setting a conda env
#PATH=$(path_prepend "$PATH" "~/miniconda/bin")

MINICONDA_PATH=~/miniconda3

## Convenience function for Anaconda miniconda Python environments
cenv () {
  if [ -z "$*" ]; then
    echo "CONDA_DEFAULT_ENV: ${CONDA_DEFAULT_ENV:-[none]}"
  elif [ "$*" = "-d" ]; then
    source "${MINICONDA_PATH}/bin/activate" root
    PATH=$(path_remove "$PATH" "${MINICONDA_PATH}/bin")
    echo "discarding ${MINICONDA_PATH}/bin from PATH again"
  else
    source "${MINICONDA_PATH}/bin/activate" $*
  fi
}
