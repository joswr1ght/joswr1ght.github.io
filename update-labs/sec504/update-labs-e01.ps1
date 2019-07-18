# Update the Windows 10 VM as needed to address lab problems.

if (-Not (Test-Path -Path C:\Tools\git-lfs.exe)) {
    # git-lfs install for lab video walkthrough access
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;
    Invoke-WebRequest https://www.dropbox.com/s/p3fmghgxqvm7n79/git-lfs.exe -OutFile c:\tools\git-lfs.exe
    git lfs install
}

# Make sure the Windows Firewall stays disabled
Start-Process cmd.exe -ArgumentList "/c","netsh","advfirewall","set","allprofiles","state","off" -Verb runAs

Write-Host "Update complete!"
