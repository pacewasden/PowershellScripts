# Define the log name and event IDs you want to analyze
$logName = "Security"
$eventIDs = @(4624, 4625)  # Example event IDs, modify based on your needs

# Get events from the specified log with the specified event IDs
$events = Get-WinEvent -LogName $logName -FilterHashtable @{Id = $eventIDs} -MaxEvents 1000

# Define patterns to search for in event messages
$patterns = @("Failed", "Error", "Unauthorized", "Audit Failure")

# Analyze events for specific patterns
foreach ($event in $events) {
    $eventMessage = $event.Message
    $eventTime = $event.TimeCreated
    $matchedPatterns = $patterns | Where-Object { $eventMessage -match $_ }

    if ($matchedPatterns.Count -gt 0) {
        Write-Host "Event ID $($event.Id) detected at $($eventTime):"
        Write-Host "Message: $($eventMessage)"
        Write-Host "Matched Patterns: $($matchedPatterns -join ', ')"
        Write-Host "-----------------------------"
    }
}
