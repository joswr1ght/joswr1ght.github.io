#!/bin/bash
{ # this ensures the entire script is downloaded #

# Remove containers stranded on a deleted Docker network. Older lib-docker.sh
# deleted and recreated sec504network without removing stopped containers, so
# RITA's clickhouse/syslog-ng/rita containers kept the old network ID and
# rita.sh failed with "network <id> not found". The fixed lib-docker.sh arrives
# with the lab files update; this clears containers already in that state.
# RITA databases are kept in the rita_clickhouse_persistent volume.
for c in $(docker ps -aq 2>/dev/null); do
    for netid in $(docker inspect -f '{{range .NetworkSettings.Networks}}{{.NetworkID}} {{end}}' "$c" 2>/dev/null); do
        if ! docker network inspect "$netid" >/dev/null 2>&1; then
            docker rm -f "$c" >/dev/null 2>&1
            break
        fi
    done
done

# Update the bootcamp exercises for ARM/x64 compat in compiled binaries.
cd ~/labs/bootcamp || exit 1
for image in bc-processes bc-olympicevent bc-permissions bc-json; do
    echo "Rebuilding $image..."
    "./$image/build.sh" || exit 1
done

# Rebuild the Password List Filtering Lightning Lab with pw-inspector from
# THC-Hydra 9.4. Hydra 9.5+ changed the filter so `-m 10` outputs nothing.
echo "Rebuilding ll-passwordlistfiltering..."
docker build -t ll-passwordlistfiltering --network=host \
    ~/labs/lightninglabs/docker/ll-passwordlistfiltering || exit 1
# Rebuild the Metasploit Lightning Lab with Metasploit 6.3.0+ for ARM/x64
# compatability in the Cacti exploit.
echo "Rebuilding ll-metasploit..."
docker build -t ll-metassploit --network=host \
    ~/labs/lightninglabs/docker/ll-metassploit || exit 1
sudo service lightninglabs restart || exit 1

echo "Update complete!"

} # this ensures the entire script is downloaded #
