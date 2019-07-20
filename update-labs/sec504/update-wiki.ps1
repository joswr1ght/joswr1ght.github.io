## This script allows the user to update the lab wiki files.
## Based on JLW's update wiki script used on Slingshot VM
## Mick Douglas, @BetterSafetyNet -- 20190327


function Check-NetConnection {
   $ProgressPreference = 'SilentlyContinue'
   $OnlineCheckResult = Test-NetConnection google.com
   if ($OnlineCheckResult.PingSucceeded -eq $FALSE) {
      Write-Error "It looks like your system isn't connected to the Internet. Please see the lab"
      Write-Error "manual for steps to connect this virtual machine to the network." 
      Write-Error "If you continue to have trouble, please contact an instructor or email " 
      Write-Error "virtual-labs-support@sans.org. Thank you!"
      exit
   }
}


function Check-AdminStatus {
   $IsRunningAsAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
   if ($IsRunningAsAdmin) {
      Write-Error "Please don't run this script as Administrator. Exit your PowerShell prompt and run again with normal privileges."
      exit 1
   }
}


function Run-Update {
   $TargetDir = "C:\wiki"
   $GitURL="ssh://git@github.com/besimorhino/SANS-504-Student-Wiki"
   if(!(Test-Path -Path $TargetDir)){
      New-Item -ItemType directory -Path $TargetDir
      if (!($?)) {
         Write-Error "Unable to create $TargetDir"
         exit
      }
      git clone $GitURL $TargetDir
      if (!($?)) {
         Write-Error "Unable to clone into $TargetDir"
         exit
      }
      git checkout MajorUpdate2019.1
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
   git checkout MajorUpdate2019.1
   if (!($?)) {
      Write-Error "Unable to checkout MajorUpdate2019.1 branch"
      exit
   }

}



# Main
Check-NetConnection
Check-AdminStatus

$OrigDir = $PSScriptRoot
Run-Update
Set-Location $OrigDir

Write-Host "Done."
