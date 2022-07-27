#!/bin/sh

set -e
set -o pipefail

packages="common-* $*"
echo "Installing packages: $packages"

# create all directories we will put files into (othewise `stow` will
# symlink the whole directory, not just the files within it):
echo "Making directories..."
find $packages -type d | grep -v '\.git' | grep / | cut -d'/' -f2- | sort -u | egrep -v '^\.$|^$' | while IFS= read -r d; do
    echo "- ~/$d"
    mkdir -p ~/$d
done
echo "done."

echo "Stowing..."
for p in ${packages}; do stow -Rv ${p}; done
echo "done."
