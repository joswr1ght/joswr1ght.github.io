# Update the Windows 10 VM as needed to address lab problems.
iwr https://joswr1ght.github.io/update-labs/sec504/known_hosts.win10.github -OutFile c:\users\sec504\.ssh\known_hosts
remove-item c:\tools\psolympics\psolympics.toml
iwr https://joswr1ght.github.io/update-labs/sec504/psolympics.toml -OutFile c:\tools\psolympics\psolympics.toml
mkdir C:\users\sec504\Documents\WindowsPowerShell -ea SilentlyContinue
Out-Null | Out-File C:\users\sec504\Documents\WindowsPowerShell\microsoft.powershell_profile.ps1 -ea SilentlyContinue
Rename-Item C:\Tools\psolympics\tpane.exe C:\Tools\psolympics\tpane.exe.old
Rename-Item C:\Tools\psolympics\launcher.exe C:\Tools\psolympics\launcher.exe.old
iwr https://joswr1ght.github.io/update-labs/sec504/tpane.exe -OutFile C:\Tools\psolympics\tpane.exe
iwr https://joswr1ght.github.io/update-labs/sec504/launcher.exe -OutFile C:\Tools\psolympics\launcher.exe
Write-Host "Update complete!"
