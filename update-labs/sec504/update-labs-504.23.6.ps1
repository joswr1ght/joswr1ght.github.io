# Update the Windows 10 VM as needed to address lab problems.
iwr https://joswr1ght.github.io/update-labs/sec504/pso/psolympics-drives.toml -OutFile C:\Tools\psolympics\psolympics-drives.toml
iwr https://joswr1ght.github.io/update-labs/sec504/pso/psolympics-pipelines.toml -OutFile C:\Tools\psolympics\psolympics-pipelines.toml
iwr https://joswr1ght.github.io/update-labs/sec504/pso/psolympics-variables.toml -OutFile C:\Tools\psolympics\psolympics-variables.toml

Write-Host "Update complete!"
