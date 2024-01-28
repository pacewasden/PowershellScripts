# Get the last installed hotfix (update)
$lastHotfix = Get-HotFix | Sort-Object InstalledOn -Descending | Select-Object -First 1

# Display information about the last installed hotfix
Write-Host "Last Installed Hotfix:"
Write-Host "Hotfix ID: $($lastHotfix.HotFixID)"
Write-Host "Description: $($lastHotfix.Description)"
Write-Host "Installed On: $($lastHotfix.InstalledOn)"
