#!/bin/bash
{ # this ensures the entire script is downloaded #

echo "Running lab update script."

echo "Updating JSON Bootcamp."
pushd
connect-net
cd /home/sec504/labs
git pull
cd bootcamp/bc-json
./build.sh
connect-lab
popd
echo "Update complete!"

} # this ensures the entire script is downloaded #
