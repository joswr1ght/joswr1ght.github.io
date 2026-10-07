#!/bin/bash
{ # this ensures the entire script is downloaded #

# Update the lab files repository. Students modify tracked lab files during the
# exercises, so fetch and reset instead of pulling, which aborts on local
# changes. Untracked files (Docker build output, models) are left in place.
pushd . > /dev/null
if cd /home/sec504/labs 2>/dev/null ; then
    BRANCH=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [ -n "$BRANCH" ] ; then
        git fetch origin "$BRANCH" > /dev/null 2>&1
        git reset --hard "origin/$BRANCH" > /dev/null 2>&1
    fi
fi
popd > /dev/null

echo "Update complete!"

} # this ensures the entire script is downloaded #
