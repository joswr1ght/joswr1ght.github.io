# Update the Windows 10 VM as needed to address lab problems.

# Replace update-wiki.ps1 with an edit to SSH over port 22 instead of 443.
iwr https://joswr1ght.github.io/update-labs/sec504/dist/update-wiki.ps1 -OutFile C:\Tools\update-wiki.ps1
Write-Host "Update complete!"
