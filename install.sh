#!/bin/sh

set -eu
set -o pipefail

packages="common-* $*"
echo "Installing packages: $packages"

echo "Stowing..."
for p in ${packages}; do stow --no-folding -Rv ${p}; done

# Per-machine package that isn't checked in, e.g. for flags read by df_flag
local_dir="${XDG_CONFIG_HOME:-$HOME/.config}/dotfiles"
if [ -d "$local_dir/local" ]; then
    stow -d "$local_dir" -t "$HOME" --no-folding -Rv local
fi
echo "done."
