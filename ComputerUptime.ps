# Get the current date
$currentDate = Get-Date -UFormat "%s"

# Get the last boot date
$bootDate = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
$bootDate = [System.Management.ManagementDateTimeConverter]::ToDateTime($bootDate)
$bootDate = $bootDate.ToUniversalTime().ToString("yyyyMMddHHmmss")

# How many seconds in 7 days
$week = 604800

# Get current uptime by subtracting the bootDate from the currentDate; result will be returned in seconds.
$uptime = $currentDate - [int64]::ParseExact($bootDate, "yyyyMMddHHmmss", $null)

if ($uptime -ge $week) {
    Write-Output "Machine Needs to be rebooted"
} else {
    Write-Output "Machine is fine"
}
