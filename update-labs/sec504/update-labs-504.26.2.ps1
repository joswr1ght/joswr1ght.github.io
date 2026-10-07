# Update the Windows VM as needed to address lab problems.
#
# Update the lab files repository in C:\Tools. Students modify tracked lab files
# during the exercises, so fetch and reset instead of pulling, which aborts on
# local changes. Untracked files (nginx, regshot, hayabusa) are left in place.
pushd
if (Test-Path -Path "C:\Tools\.git") {
    Set-Location "C:\Tools"
    $env:GIT_TERMINAL_PROMPT = 0
    $Branch = git symbolic-ref --short HEAD 2>$null
    if ($Branch) {
        git fetch origin $Branch *> $null
        git reset --hard "origin/$Branch" *> $null
    }
}
popd

Write-Host "Update complete!"
