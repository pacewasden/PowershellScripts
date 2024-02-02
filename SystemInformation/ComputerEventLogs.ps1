# Get events from the Application event log using Get-WinEvent
#You can change System for "Security" or "Application" in order to get different 
#events
$applicationEvents = Get-WinEvent -LogName System -MaxEvents 10

# Display event information
$applicationEvents | Format-Table -AutoSize
