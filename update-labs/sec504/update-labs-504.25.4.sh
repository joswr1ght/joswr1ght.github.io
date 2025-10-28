#!/bin/bash
{ # this ensures the entire script is downloaded #
# Fix wiki GitHub repo following reflow for video removal
# If the /usr/local/bin/ollama file exists, we are running a 2025.1 update
pushd . > /dev/null
cd ~/wiki
git fetch origin
if [[ -f "/usr/local/bin/ollama" ]]; then
    echo -n "Applying 2025.1 update... "
    git reset --hard origin/MajorUpdate2025.1
    # Set Firefox as default browser for HTML files (Bruno stole this)
    xdg-mime default firefox.desktop text/html
else
    echo -n "Applying 2024.1 update... "
    git reset --hard origin/MajorUpdate2024.1
fi
popd > /dev/null

echo "Update complete!"

} # this ensures the entire script is downloaded #
