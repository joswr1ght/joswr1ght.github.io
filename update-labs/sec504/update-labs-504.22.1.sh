#!/bin/bash
{ # this ensures the entire script is downloaded #

echo "Running lab update script."
pushd .
sudo sed -i '1 s/127.0.0.1.*/127.0.0.1 localhost slingshot sec504-slingshot/' /etc/hosts
popd
echo "Update complete!"

} # this ensures the entire script is downloaded #
