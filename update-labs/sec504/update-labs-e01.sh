#!/bin/bash
{ # this ensures the entire script is downloaded #

sudo rm /opt/Responder/Responder.db
pushd . >/dev/null
cd /tmp
wget https://joswr1ght.github.io/update-labs/sec504/stop.sh
wget https://joswr1ght.github.io/update-labs/sec504/xssautorun.sh
mv stop.sh /home/sec504/CourseFiles/weblab/stop.sh
mv xssautorun.sh /home/sec504/.quick/xssautorun.sh
popd >/dev/null

echo "Update complete!"

} # this ensures the entire script is downloaded #
