## This script allows the user to update the lab wiki files.
## Based on JLW's update wiki script used on Slingshot VM
## Mick Douglas, @BetterSafetyNet -- 20190327
## Continued maintenance - Joshua Wright -- 20210804

$Branch = "MajorUpdate2023.1"

function Check-NetConnection {
    $ProgressPreference = 'SilentlyContinue'
    $OnlineCheckResult = Test-NetConnection 8.8.8.8
    if ($OnlineCheckResult.PingSucceeded -eq $FALSE) {

        # Try again using 4.4.4.4
        $OnlineCheckResult = Test-NetConnection 4.4.4.4
        if ($OnlineCheckResult.PingSucceeded -eq $FALSE) {

            # One last test using www.sans.org on TCP/443
            $OnlineCheckResult = Test-NetConnection -Port 443 -ComputerName "www.sans.org"
            if ($OnlineCheckResult.PingSucceeded -eq $FALSE) {
                # This failed, so try and revert network connection settings back to static
                netsh int ip set address "Ethernet" static 10.10.0.1 255.255.0.0 0.0.0.0 1
		# Disable turning off firewall; blocked from starting using Process Hacker 2
		# https://twitter.com/jonasLyk/status/1368361467796463619?t=qF8bjxn0QrrqHFHJO2yqbg&s=19
                #Get-NetFirewallProfile | Set-NetFirewallProfile -enabled False
                netsh interface ipv4 show config "Ethernet"

                Write-Error "It looks like your system isn't connected to the Internet. Please see the lab"
                Write-Error "manual for steps to connect this virtual machine to the network."
                Write-Error "If you continue to have trouble, please contact an instructor or email "
                Write-Error "virtual-labs-support@sans.org. Thank you!"
                exit
            }
        }
    }
}

function Check-AdminStatus {
    $IsRunningAsAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
    if ( -not $IsRunningAsAdmin) {
        Write-Host -ForegroundColor red "Please run this script as Administrator. Exit your PowerShell prompt and run again with Administrator privileges."
        exit 1
    }
}

function Check-PowerShellISE {
    
    if ( $host.name -match "ISE") {
        Write-Host -ForegroundColor red "PowerShell ISE is not supported for this script."
        exit 1
    }
}

function Run-Update {
   $TargetDir = "C:\wiki"
   $GitURL="ssh://git@ssh.github.com/joswr1ght/SANS-504-Student-Wiki"
   if(!(Test-Path -Path $TargetDir)){
      New-Item -ItemType directory -Path $TargetDir
      if (!($?)) {
         Write-Error "Unable to create $TargetDir"
         exit
      }
      git clone --depth 1 -b $Branch $GitURL $TargetDir
      if (!($?)) {
         Write-Error "Unable to clone into $TargetDir"
         exit
      }
      git checkout $Branch
   }

   Set-Location $TargetDir
   if (!($?)) {
      Write-Error "Unable to cd into $TargetDir. Remove the directory and try again."
      exit
   }

   git reset HEAD --hard
   if (!($?)) {
      Write-Error "Cannot perform reset on $TargetDir"
      exit
   }

   git pull
   if (!($?)) {
      Write-Error "Unable to update $TargetDir"
      exit
   }
   git checkout $Branch
   if (!($?)) {
      Write-Error "Unable to checkout $Branch branch"
      exit
   }

}



# Check admin status
Check-AdminStatus

# Check for PowerShell ISE
Check-PowerShellISE

# Change to DHCP, obtain IP
Write-Host "Resetting IP Address and Subnet Mask For DHCP"
netsh int ip set address name = "Ethernet" source = dhcp | Out-Null

Write-Host "Resetting DNS For DHCP"
netsh int ip set dns name = "Ethernet" source = dhcp | Out-Null

Write-Host "Resetting Windows Internet Name Service (WINS) For DHCP"
netsh int ip set wins name = "Ethernet" source = dhcp | Out-Null
#Get-NetFirewallProfile | Set-NetFirewallProfile -enabled False

Start-Sleep 3

# Check network status
Check-NetConnection

Write-Host "Running update.`n"

$OrigDir = $PSScriptRoot
Run-Update
Set-Location $OrigDir

# Restore static IP
Write-Host "`nRestoring static IP for lab use."
netsh int ip set address "Ethernet" static 10.10.0.1 255.255.0.0 0.0.0.0 1 | Out-Null
#Get-NetFirewallProfile | Set-NetFirewallProfile -enabled False

Write-Host "`nDone."