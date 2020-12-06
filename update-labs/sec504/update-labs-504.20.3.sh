#!/bin/bash
{ # this ensures the entire script is downloaded #

echo "Running lab update script."

# Fix Please tell me who you are problem running update-wiki
cd $HOME/wiki
git pull >/dev/null 2>/dev/null
git reset --hard origin/MinorUpdate2020.2


# Fix problem with SSH pivot lab and Drupal target unable to connect back
set -euo pipefail

stoppivottgt >/dev/null 2>&1 || true

pushd . >/dev/null
cd $HOME/labs
git checkout bin/update-labs
git checkout weblab/php.log
git pull >/dev/null
echo Network temporarily offline while rebuilding Docker target
sudo ifconfig eth0 down

echo Rebuilding Docker target for pivot lab
cd $HOME/labs/pivotlab/drupal
./build.sh >/dev/null 2>/dev/null

echo Rebuilding Docker target for Bootcamp: Common Commands
cd $HOME/labs/bootcamp/bc-commoncommands
./build.sh >/dev/null 2>/dev/null

echo Rebuilding Docker target for Bootcamp: Olympic Event
cd $HOME/labs/bootcamp/bc-olympicevent
./build.sh >/dev/null 2>/dev/null

sudo ifconfig eth0 up
echo Done.
popd >/dev/null
connect-net

echo "Update complete!"

} # this ensures the entire script is downloaded #
