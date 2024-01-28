# Create a Windows Update Session COM object
$updateSession = New-Object -ComObject Microsoft.Update.Session

# Create an UpdateSearcher COM object
$updateSearcher = $updateSession.CreateUpdateSearcher()

# Search for pending updates
$searchResult = $updateSearcher.Search("IsInstalled=0")

# Display information about the latest update
$latestUpdate = $searchResult.Updates | Sort-Object -Property Date -Descending | Select-Object -First 1

Write-Host "Latest Available Update:"
Write-Host "Title: $($latestUpdate.Title)"
Write-Host "Description: $($latestUpdate.Description)"
Write-Host "Installation Date: $($latestUpdate.Date)"
