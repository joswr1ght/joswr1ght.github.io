#!/bin/bash
{ # this ensures the entire script is downloaded #

echo "Running lab update script."
pushd . >/dev/null 2>&1

# Move WeTTY to TCP/3001
sed -i 's/:3000/:3001/' /opt/lightninglabs/sample/docker/ll-wetty/Dockerfile /opt/lightninglabs/src/templates/footer.html
sed -i 's/ 3000/ 3001/' /opt/lightninglabs/src/templates/footer.html
sed -i 's/3000/3001/g' /opt/lightninglabs/src/container.py
sed -i 's/--bypass-helmet/--bypass-helmet -p 3001/' /opt/lightninglabs/src/container.py

llrestart

popd 2>&1
echo "Update complete!"

} # this ensures the entire script is downloaded #
