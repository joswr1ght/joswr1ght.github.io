# Update the Windows 10 VM as needed to address lab problems.
iwr https://joswr1ght.github.io/update-labs/sec504/pso/psolympics-gettingstarted.toml -OutFile C:\tools\psolympics\psolympics-gettingstarted.toml
iwr https://joswr1ght.github.io/update-labs/sec504/pso/psolympics-variables.toml -OutFile C:\tools\psolympics\psolympics-variables.toml
iwr https://joswr1ght.github.io/update-labs/sec504/known_hosts.win10.github -OutFile c:\users\sec504\.ssh\known_hosts
Write-Host "Update complete!"
