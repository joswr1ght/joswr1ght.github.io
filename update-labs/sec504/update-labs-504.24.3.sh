#!/bin/bash
{ # this ensures the entire script is downloaded #

cd /home/sec504/labs/onlinepasstgt/edirectory && ./build.sh >>/tmp/update-labs.log 2>&1
ssh-keygen -f "/home/sec504/.ssh/known_hosts" -R "172.30.0.185" >>/tmp/update-labs.log 2>&1
echo "Update complete!"

} # this ensures the entire script is downloaded #
