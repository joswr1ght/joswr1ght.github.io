#!/bin/bash
{ # this ensures the entire script is downloaded #

# Remove stale SSH key from
ssh-keygen -f "/home/sec504/.ssh/known_hosts" -R "10.142.145.110" >/dev/null 2>&1
ssh-keygen -f "/home/sec504/.ssh/known_hosts" -R "ops.issplaylist.com" >/dev/null 2>&1

echo "Update complete!"

} # this ensures the entire script is downloaded #
