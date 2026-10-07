#!/bin/bash
{ # this ensures the entire script is downloaded #

# The AI Scoping Lightning Lab is commented out of events.toml, but Lightning
# Labs reads its configuration only at startup, so the change takes effect only
# after a restart. Clear the failure counter first: a VM that already picked up
# the config change leaves the unit rate-limited, and systemd then refuses a
# plain restart with "Start request repeated too quickly."
echo -n "Restarting Lightning Labs... "
sudo systemctl reset-failed lightninglabs > /dev/null 2>&1
sudo service lightninglabs restart > /dev/null 2>&1

# The unit is Type=simple, so the restart reports success as soon as the process
# forks, even when a configuration error kills it moments later. Let systemd
# settle, then confirm the service is up and was not auto-restarted.
sleep 2
RESTARTS=$(systemctl show -p NRestarts --value lightninglabs 2>/dev/null)
if systemctl is-active --quiet lightninglabs && [ "${RESTARTS:-0}" = "0" ] ; then
    echo "Done."
else
    echo "FAILED."
    echo "Lightning Labs did not restart. Please contact an instructor or a TA." 1>&2
fi

echo "Update complete!"

} # this ensures the entire script is downloaded #
