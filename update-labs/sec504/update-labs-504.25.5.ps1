# Update the Windows 10 VM as needed to address lab problems.
#
# Turn on File and Printer sharing on Windows Ethernet1
Enable-NetAdapterBinding -Name "Ethernet1" -ComponentID ms_server

Write-Host "Update complete!"
