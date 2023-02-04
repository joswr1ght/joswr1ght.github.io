#!/bin/bash
{ # this ensures the entire script is downloaded #

echo "Running lab update script."
pushd . >/dev/null
rm ~/Downloads/foo.ovpn 2>/dev/null
cd ~/labs && git stash 2>/dev/nul
git pull
popd >/dev/null
echo "Update complete!"

} # this ensures the entire script is downloaded #
