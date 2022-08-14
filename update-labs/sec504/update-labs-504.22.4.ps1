# Update the Windows 10 VM as needed to address lab problems.
iwr https://joswr1ght.github.io/update-labs/sec504/psolympics-gettingstarted.toml -OutFile C:\tools\psolympics\psolympics-gettingstarted.toml
iwr https://joswr1ght.github.io/update-labs/sec504/psolympics-variables.toml -OutFile C:\tools\psolympics\psolympics-variables.toml
Write-Host "Update complete!"
