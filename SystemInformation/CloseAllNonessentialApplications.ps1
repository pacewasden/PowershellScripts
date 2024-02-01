# This Script is pretty stupid

# This will show all the active processes on Windows 
# Get all active processes
$allProcesses = Get-Process
# Display process information
$allProcesses | Format-Table -AutoSize
# More concise script 
$allProcesses | Select-Object -ExpandProperty ProcessName
# This blows up all the active programs
# Get all processes except essential ones
$processesToKeep = @("explorer", "powershell", "svchost", "lsass", "wininit")

# Get all processes and filter out the essential ones
$processesToStop = Get-Process | Where-Object { $processesToKeep -notcontains $_.ProcessName }

# Stop each non-essential process
$processesToStop | ForEach-Object { Stop-Process -Name $_.ProcessName -Force }

Write-Output "All non-essential processes stopped."
