# Specify the output XML file path
$outputFilePath = "C:\Users\"

# Create an XML document
$xmlDoc = New-Object System.Xml.XmlDocument
$xmlRoot = $xmlDoc.CreateElement("UserLogs")
$xmlDoc.AppendChild($xmlRoot)

# Get all user accounts on the machine
$users = Get-WmiObject Win32_UserAccount

foreach ($user in $users) {
    $userElement = $xmlDoc.CreateElement("User")
    $userElement.SetAttribute("Name", $user.Name)

    # Get the last ten security events for each user
    $events = Get-WinEvent -FilterHashtable @{
        LogName   = 'Security'
        ID        = 4624, 4625  # Logon success and failure events
        StartTime = (Get-Date).AddDays(-30)  # Adjust the time range as needed
        UserId    = $user.SID.Value
    } -MaxEvents 10 -ErrorAction SilentlyContinue

    if ($events.Count -eq 0) {
        # No events found for this user
        $noLogsElement = $xmlDoc.CreateElement("NoLogs")
        $noLogsElement.InnerText = "No logs found for $($user.Name)"
        $userElement.AppendChild($noLogsElement)
    } else {
        # Add event information to the XML
        foreach ($event in $events) {
            $eventElement = $xmlDoc.CreateElement("Event")
            $eventElement.SetAttribute("TimeCreated", $event.TimeCreated)
            $eventElement.SetAttribute("EventID", $event.Id)
            $eventElement.InnerText = $event.Message
            $userElement.AppendChild($eventElement)
        }
    }

    $xmlRoot.AppendChild($userElement)
}

# Save the XML document to the specified file
$xmlDoc.Save($outputFilePath)

Write-Host "User logs information exported to $outputFilePath"

