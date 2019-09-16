#!/bin/bash
{ # this ensures the entire script is downloaded #

echo "Running lab update script."
wget --output-document /tmp/go.tgz
tar xfz /tmp/go.tgz -C /home/sec504

echo "Update complete!"

} # this ensures the entire script is downloaded #
