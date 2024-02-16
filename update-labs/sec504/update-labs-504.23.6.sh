#!/bin/bash
{ # this ensures the entire script is downloaded #

echo "Running lab update script."
pushd .
sudo ln -s /home/sec504/bin/display4k /usr/local/bin/display4k
sudo ln -s /home/sec504/bin/displayauto /usr/local/bin/displayauto
popd
echo "Update complete!"

} # this ensures the entire script is downloaded #
