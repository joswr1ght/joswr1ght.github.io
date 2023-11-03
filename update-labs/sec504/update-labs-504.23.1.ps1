# Update the Windows 10 VM as needed to address lab problems.
iwr https://joswr1ght.github.io/update-labs/sec504/known_hosts.win10.github -OutFile c:\users\sec504\.ssh\known_hosts

mkdir C:\users\sec504\Documents\WindowsPowerShell -ea SilentlyContinue
Out-Null | Out-File C:\users\sec504\Documents\WindowsPowerShell\microsoft.powershell_profile.ps1 -ea SilentlyContinue

iwr https://joswr1ght.github.io/update-labs/sec504/pso/psolympics.toml -OutFile c:\tools\psolympics\psolympics.toml
iwr https://joswr1ght.github.io/update-labs/sec504/pso/tpane.exe -OutFile C:\Tools\psolympics\tpane.exe
iwr https://joswr1ght.github.io/update-labs/sec504/pso/launcher.exe -OutFile C:\Tools\psolympics\launcher.exe
iwr https://joswr1ght.github.io/update-labs/sec504/pso/psolympics-drives.toml -OutFile C:\Tools\psolympics\psolympics-drives.toml
iwr https://joswr1ght.github.io/update-labs/sec504/pso/psolympics-gettingstarted.toml -OutFile C:\Tools\psolympics\psolympics-gettingstarted.toml
iwr https://joswr1ght.github.io/update-labs/sec504/pso/psolympics-pipelines.toml -OutFile C:\Tools\psolympics\psolympics-pipelines.toml
iwr https://joswr1ght.github.io/update-labs/sec504/pso/psolympics-variables.toml -OutFile C:\Tools\psolympics\psolympics-variables.toml

Write-Host "Update complete!"
