#!/bin/sh

set -eu
set -o pipefail

packages="common-* $*"
echo "Installing packages: $packages"

echo "Stowing..."
for p in ${packages}; do stow --no-folding -Rv ${p}; done
echo "done."
