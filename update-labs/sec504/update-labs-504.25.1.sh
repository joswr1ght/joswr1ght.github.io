#!/bin/bash
{ # this ensures the entire script is downloaded #
# Fix wiki GitHub repo following reflow for video removal
# If the /usr/local/bin/ollama file exists, we are running a 2025.1 update
pushd . > /dev/null
cd ~/wiki
git fetch origin
if [[ -f /usr/local/bin/ollama ]]; then
    git reset --hard origin/MajorUpdate2025.1
else
    git reset --hard origin/MajorUpdate2024.1
fi
popd > /dev/null

echo "Update complete!"

} # this ensures the entire script is downloaded #
