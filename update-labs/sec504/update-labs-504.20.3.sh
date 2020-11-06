#!/bin/bash
{ # this ensures the entire script is downloaded #

echo "Running lab update script."

# Fix problem with SSH pivot lab and Drupal target unable to connect back
set -euo pipefail

stoppivottgt >/dev/null 2>&1 || true

pushd . >/dev/null
cd $HOME/labs
git checkout bin/update-labs
git checkout weblab/php.log
git pull >/dev/null
echo Reverting to lab IP address configuration
connect-lab
cd $HOME/labs/pivotlab/drupal
echo Rebuilding Docker target for pivot lab
./build.sh >/dev/null 2>/dev/null
echo Done.
popd >/dev/null

echo "Update complete!"

} # this ensures the entire script is downloaded #
