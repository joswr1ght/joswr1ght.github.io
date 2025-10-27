# Update the Windows 10 VM as needed to address lab problems.
#
# Fix wiki GitHub repo following reflow for video removal in MajorUpdate2024.1
pushd
cd C:\wiki
git fetch origin
git reset --hard origin/MajorUpdate2025.1
popd

Write-Host "Update complete!"
