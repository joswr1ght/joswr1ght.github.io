#!/bin/bash
{ # this ensures the entire script is downloaded #

echo "Running lab update script."
pushd . >/dev/null 2>&1
cd ~/labs
git pull >/dev/null
popd 2>&1
llrestart
echo "Update complete!"

} # this ensures the entire script is downloaded #
