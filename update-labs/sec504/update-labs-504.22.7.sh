#!/bin/bash
{ # this ensures the entire script is downloaded #

echo "Running lab update script."
rm ~/Downloads/foo.ovpn 2>/dev/null
cd ~/labs/bin && git checkout connect-ctf
echo "Update complete!"

} # this ensures the entire script is downloaded #
