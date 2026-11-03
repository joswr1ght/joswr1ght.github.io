#!/bin/bash
{ # this ensures the entire script is downloaded #

# update-labs has already refreshed ~/labs before running this script.
cd ~/labs/bootcamp || exit 1

for image in bc-processes bc-olympicevent bc-permissions bc-json; do
    echo "Rebuilding $image..."
    "./$image/build.sh" || exit 1
done

echo "Update complete!"

} # this ensures the entire script is downloaded #
