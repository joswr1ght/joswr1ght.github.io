#!/bin/bash
{ # this ensures the entire script is downloaded #

echo "Running lab update script."
pushd . >/dev/null 2>&1
cd ~/labs
git pull >/dev/null

# Move WeTTY to TCP/3001
curl -s -L https://joswr1ght.github.com/update-labs/sec504/lightninglabs-20231103.tgz | tar xz - -C /opt
llrestart

popd 2>&1
echo "Update complete!"

} # this ensures the entire script is downloaded #
