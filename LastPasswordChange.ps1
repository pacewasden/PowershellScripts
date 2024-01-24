# Get the current username
$currentUsername = $env:USERNAME

# Get the last password change time
$passwordLastSet = (Get-LocalUser -Name $currentUsername).PasswordLastSet

# Convert the last password change time to a readable format
$lastChangeTime = [System.DateTime]::FromFileTime($passwordLastSet.Ticks)

# Display the result
Write-Host "Last Password Change Time for {$currentUsername}: $lastChangeTime"
