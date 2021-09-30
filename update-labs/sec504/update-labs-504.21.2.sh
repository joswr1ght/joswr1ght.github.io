#!/bin/bash
{ # this ensures the entire script is downloaded #

echo "Running lab update script."

echo "Updating JSON Bootcamp."
pushd .
(connect-net && cd /home/sec504/labs && git pull && cd bootcamp/bc-json && ./build.sh && connect-lab) >/tmp/update-labs.log 2>&1
if [ $? -ne 0 ]; then
    echo "Update process experienced an error. See /tmp/update-labs.log and contact the instructor for assistance."
fi
popd
echo "Update complete!"

} # this ensures the entire script is downloaded #
