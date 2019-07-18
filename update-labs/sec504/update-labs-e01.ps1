# Update the Windows 10 VM as needed to address lab problems.

# git-lfs install for lab video walkthrough access
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;
Invoke-WebRequest https://joswr1ght.github.io/update-labs/sec504/git-lfs.exe -OutFile c:\tools\git-lfs.exe
git lfs install

Write-Host "Update complete!"
