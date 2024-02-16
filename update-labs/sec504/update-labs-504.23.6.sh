#!/bin/bash
{ # this ensures the entire script is downloaded #

echo "Running lab update script."
pushd .
sudo ln -s /home/sec504/labs/bin/display4k /usr/local/bin/display4k 2>/dev/null
sudo ln -s /home/sec504/labs/bin/displayauto /usr/local/bin/displayauto 2>/dev/null
popd
echo "Update complete!"

} # this ensures the entire script is downloaded #
