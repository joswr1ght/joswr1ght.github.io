#!/bin/bash

#if [[ $EUID -ne 0 ]]; then
#   echo "This script must be run as root"
#   exit 1
#fi
#
sudo pkill php

sudo service mysql stop

echo
echo "Complete!"
