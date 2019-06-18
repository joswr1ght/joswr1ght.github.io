#!/bin/bash
{ # this ensures the entire script is downloaded #
pushd . >/dev/null
cd /root/sec617/bluetooth/btfind/
git pull >/dev/null
popd . >/dev/null

echo "Update complete!"

} # this ensures the entire script is downloaded #
