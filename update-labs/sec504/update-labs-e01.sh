#!/bin/bash
{ # this ensures the entire script is downloaded #

echo "Running lab update script, this will take several minutes to complete."

# Remove default Responder.db file
sudo rm /opt/Responder/Responder.db >/dev/null 2>&1

# Update XSS lab autorun script
pushd . >/dev/null
cd /tmp
wget https://joswr1ght.github.io/update-labs/sec504/stop.sh >/dev/null 2>&1
wget https://joswr1ght.github.io/update-labs/sec504/xssautorun.sh >/dev/null 2>&1
mv stop.sh /home/sec504/CourseFiles/weblab/stop.sh
mv xssautorun.sh /home/sec504/.quick/xssautorun.sh
chmod 755 /home/sec504/CourseFiles/weblab/stop.sh
chmod 755 /home/sec504/.quick/xssautorun.sh
popd >/dev/null

# Update smbtgt lab
pushd . >/dev/null
cd /home/sec504/CourseFiles/
wget https://joswr1ght.github.io/update-labs/sec504/smbtgt.tgz >/dev/null 2>&1
wget https://joswr1ght.github.io/update-labs/sec504/gosmbtgt >/dev/null 2>&1
sudo mv gosmbtgt /usr/local/bin/gosmbtgt
sudo chmod 755 /usr/local/bin/gosmbtgt
tar xfz smbtgt.tgz
cd smbtgt
docker build -t smbtgt . >/dev/null
popd >/dev/null

# Install git-lfs for lab video walkthroughs
pushd . >/dev/null
# Install git-lfs
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash >/dev/null
sudo apt-get install git-lfs -y >/dev/null
git lfs install
popd >/dev/null


echo "Update complete!"

} # this ensures the entire script is downloaded #
