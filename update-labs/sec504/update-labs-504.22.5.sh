#!/bin/bash
{ # this ensures the entire script is downloaded #

echo "Running lab update script."
pushd . >/dev/null
rm ~/Downloads/foo.ovpn 2>/dev/null
cd ~/labs && git checkout bin/connect-ctf >/dev/null 2>/dev/null
git pull
popd >/dev/null
echo "Update complete!"

} # this ensures the entire script is downloaded #
