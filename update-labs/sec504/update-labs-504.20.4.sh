#!/bin/bash
{ # this ensures the entire script is downloaded #

echo "Running lab update script."

# Fix Please tell me who you are problem running update-wiki
cd $HOME/wiki
git pull >/dev/null 2>/dev/null
git reset --hard origin/MinorUpdate2020.2

stoppivottgt >/dev/null 2>&1 || true

pushd . >/dev/null

echo Updating lab-specific scripts and files
cd $HOME/labs
git checkout bin/update-labs >/dev/null
git checkout weblab/php.log >/dev/null
git pull >/dev/null

echo Rebuilding Docker target for pivot lab
cd $HOME/labs/pivotlab/drupal
./build.sh >/dev/null 2>/dev/null

echo Rebuilding Docker target for Bootcamp: Common Commands
cd $HOME/labs/bootcamp/bc-commoncommands
./build.sh >/dev/null 2>/dev/null

echo Rebuilding Docker target for Bootcamp: Olympic Event
cd $HOME/labs/bootcamp/bc-olympicevent
./build.sh >/dev/null 2>/dev/null

popd >/dev/null
echo "Update complete!"

} # this ensures the entire script is downloaded #
