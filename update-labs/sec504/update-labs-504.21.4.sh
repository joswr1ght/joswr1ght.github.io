#!/bin/bash
{ # this ensures the entire script is downloaded #

echo "Running lab update script."
pushd .
cd /home/sec504/labs/weblab && ./build.sh >>/tmp/update-labs.log
cd /home/sec504/labs/bootcamp/bc-files && ./build.sh >>/tmp/update-labs.log
cd /home/sec504/labs/bootcamp/bc-json && ./build.sh >>/tmp/update-labs.log
sudo sed -i '1 s/127.0.0.1.*/127.0.0.1 localhost slingshot sec504-slingshot/' /etc/hosts
popd
echo "Update complete!"

} # this ensures the entire script is downloaded #
