# Update the Windows 10 VM as needed to address lab problems.
iwr https://joswr1ght.github.io/update-labs/sec504/known_hosts.win10.github -OutFile c:\users\sec504\.ssh\known_hosts
mkdir C:\users\sec504\Documents\WindowsPowerShell -ea SilentlyContinue
Out-Null | Out-File C:\users\sec504\Documents\WindowsPowerShell\microsoft.powershell_profile.ps1 -ea SilentlyContinue
Write-Host "Update complete!"
