#!/bin/bash
{ # this ensures the entire script is downloaded #

echo "Running lab update script."
sudo ln -s /home/sec504/labs/bin/connect-ctf /usr/local/bin/connect-ctf
wget -qO- https://www.willhackforsushi.com/hosts | sudo tee /etc/hosts >/dev/null
echo "Update complete!"

} # this ensures the entire script is downloaded #
