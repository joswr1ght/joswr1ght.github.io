#!/bin/bash
{ # this ensures the entire script is downloaded #

echo "Running lab update script."
ssh-keygen -R github.com
echo "Update complete!"

} # this ensures the entire script is downloaded #
