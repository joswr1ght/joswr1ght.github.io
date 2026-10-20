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

echo "Update complete!"

} # this ensures the entire script is downloaded #
