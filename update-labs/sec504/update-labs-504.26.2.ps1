# Update the Windows VM as needed to address lab problems.

# VM images built before update-labs.ps1 learned to update C:\Tools only run
# this script, so update C:\Tools here. Students modify tracked lab files, so
# reset instead of pulling. Untracked files (nginx, regshot, hayabusa) are left
# in place.
if (Test-Path -Path "C:\Tools\.git") {
    $env:GIT_TERMINAL_PROMPT = 0
    $LabBranch = git -C C:\Tools symbolic-ref --short HEAD 2>$null
    if (-not $LabBranch) { $LabBranch = "504.26.2" }
    $GitOutput = & { git -C C:\Tools fetch -q origin $LabBranch; if ($?) { git -C C:\Tools reset -q --hard FETCH_HEAD } } 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host -ForegroundColor Red "Unable to update C:\Tools (Git exit status $LASTEXITCODE)."
        $GitOutput | ForEach-Object { Write-Host -ForegroundColor Red $_.ToString() }
    }
}

Write-Host "Update complete!"
