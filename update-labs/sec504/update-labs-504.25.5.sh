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

# The mcp Python library published a 2.x release with breaking API changes. The
# cURL MCP Agent container resolved its dependencies at each startup, so it began
# pulling mcp 2.x and crashing before it could listen on port 3003. OpenWebUI then
# reports an error connecting to the cURL MCP connector. The lab files now pin
# mcp<2 and install at build time, so the container needs to be rebuilt.
CURLMCP=/home/sec504/labs/offensiveai/curl-mcp
if [ -d "$CURLMCP" ]; then
    if ! grep -q '<2' "$CURLMCP/requirements.txt" 2>/dev/null; then
        echo "WARNING: The lab files are out of date, so the cURL MCP Agent cannot be" 1>&2
        echo "repaired. Please contact an instructor or a TA for assistance." 1>&2
    else
        sudo service docker start >/dev/null 2>&1
        docker rm -f curl-mcp >/dev/null 2>&1

        echo -n "Rebuilding the cURL MCP Agent container (a few minutes)... "
        if "$CURLMCP/build.sh" >/tmp/curl-mcp-build.log 2>&1 ; then
            echo "Done."
        else
            echo "FAILED."
            echo "The cURL MCP Agent container did not rebuild. The build log is saved in" 1>&2
            echo "/tmp/curl-mcp-build.log. Please contact an instructor or a TA." 1>&2
        fi

        # Students who ran `update-labs docker` also rebuilt the MCP proxy against
        # mcp 2.x, which breaks it the same way. Rebuild it only when it is broken,
        # since this build takes several minutes.
        if ! docker run --rm --entrypoint python mcpo -c "import mcpo.main" >/dev/null 2>&1 ; then
            echo -n "Rebuilding the MCP Proxy container (several minutes)... "
            if (cd /home/sec504/labs/offensiveai/mcpo && ./build.sh) >/tmp/mcpo-build.log 2>&1 ; then
                echo "Done."
            else
                echo "FAILED."
                echo "The MCP Proxy container did not rebuild. The build log is saved in" 1>&2
                echo "/tmp/mcpo-build.log. Please contact an instructor or a TA." 1>&2
            fi
        fi

        echo "If the offensive AI lab is running, stop it with stopoffensiveai and start"
        echo "it again with gooffensiveai to use the repaired containers."
    fi
fi

echo "Update complete!"

} # this ensures the entire script is downloaded #
