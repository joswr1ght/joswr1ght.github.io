# Update the Windows 10 VM as needed to address lab problems.

# Download an updated update-labs.ps1 script that tests for connectivity
# against 8.8.8.8 instead of GitHub.com
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -OutFile C:\Tools\update-labs.ps1 https://joswr1ght.github.io/update-labs/sec504/update-labs-e01.ps1
Invoke-WebRequest -OutFile C:\Tools\update-wiki.ps1 https://joswr1ght.github.io/update-labs/sec504/update-wiki-e01.ps1

Write-Host "Update complete!"
