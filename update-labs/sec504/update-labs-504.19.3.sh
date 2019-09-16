#!/bin/bash
{ # this ensures the entire script is downloaded #

echo "Running lab update script."
wget --output-document /tmp/go.tgz https://joswr1ght.github.io/update-labs/sec504/go.tgz
tar xfz /tmp/go.tgz -C /home/sec504

echo "Update complete!"

} # this ensures the entire script is downloaded #
