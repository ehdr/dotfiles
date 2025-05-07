#!/usr/bin/env -i zsh -f
# ^ starts zsh without loading personal config files or environment variables,
# to prevent things like gnu coreutilities from interfering with upgrades.

set -o errexit
set -o pipefail

if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

function echo_and_run () {
  echo
  echo "+$@"
  $@
}

echo_and_run brew update
echo_and_run brew doctor
echo_and_run brew update

to_upgrade=$(brew outdated)
if [ -z "$to_upgrade" ]; then
  exit 0
fi

echo
if ! read -qs 'i?Continue upgrade? (y/N) '; then
  echo
  exit 0
fi

echo_and_run brew upgrade
echo_and_run brew cleanup

to_autoremove=$(brew autoremove --dry-run)
if [ -z "$to_autoremove" ]; then
  exit 0
fi

echo
echo $to_autoremove
echo
# `read -q` returns "zero only if the character was ‘y’ or ‘Y’", see:
# http://zsh.sourceforge.net/Doc/Release/Shell-Builtin-Commands.html#index-read
if read -qs 'i?Remove them by running `brew autoremove`? (y/N) '; then
  echo_and_run brew autoremove
  echo_and_run brew cleanup
fi

echo_and_run brew doctor

leaves_installed_as_dependencies=$(brew leaves --installed-as-dependency)
if [ -n "$leaves_installed_as_dependencies" ]; then
  echo "Some leaf packages that were installed as dependencies remain:"
  echo $leaves_installed_as_dependencies
fi

echo
