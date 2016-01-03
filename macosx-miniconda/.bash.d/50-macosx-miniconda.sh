is_interactive_shell || return

## Set up PATH for Anaconda miniconda Python distribution
# Actually, I prefer to have the "system" Python in PATH by default, and
# choose to use the conda ones only by explicitly setting a conda env
#PATH=$(path_prepend "$PATH" "~/miniconda/bin")

## Convenience function for Anaconda miniconda Python environments
cenv () {
  if [ -z "$*" ]; then
    echo "CONDA_DEFAULT_ENV: ${CONDA_DEFAULT_ENV:-[none]}"
  else
    source ~/miniconda/bin/activate $*
  fi
}
