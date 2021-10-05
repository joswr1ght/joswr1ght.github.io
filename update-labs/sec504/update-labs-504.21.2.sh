#!/bin/bash
{ # this ensures the entire script is downloaded #

echo "Running lab update script."

echo "Updating Bootcamp Containers."
pushd . >/dev/null
(cd /home/sec504/labs && git pull && cd bootcamp/bc-json && ./build.sh && cd ../bc-networking && ./build.sh) >/tmp/update-labs.log 2>&1
if [ $? -ne 0 ]; then
    echo "Update process experienced an error. See /tmp/update-labs.log and contact the instructor for assistance."
fi
popd >/dev/null
echo "Update complete!"

} # this ensures the entire script is downloaded #
