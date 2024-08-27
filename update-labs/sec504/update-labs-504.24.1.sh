#!/bin/bash
{ # this ensures the entire script is downloaded #

# Remove stale SSH key from
ssh-keygen -f "/home/sec504/.ssh/known_hosts" -R "10.142.145.110" >/dev/null 2>&1
ssh-keygen -f "/home/sec504/.ssh/known_hosts" -R "ops.issplaylist.com" >/dev/null 2>&1

# Clean Firefox history
find /home/sec504/.mozilla/firefox -name key4.db -print -exec rm {} \; >/dev/null 2>&1
rm /home/sec504/.mozilla/firefox/*.default/*.sqlite >/dev/null 2>&1
rm /home/sec504/.mozilla/firefox/*.default/sessionstore.js >/dev/null 2>&1
rm -r /home/sec504/.cache/mozilla/firefox/* >/dev/null 2>&1

echo "Update complete!"

} # this ensures the entire script is downloaded #
