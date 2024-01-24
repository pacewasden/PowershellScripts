# Display connected networks
Write-Host "Connected Networks:"

Get-NetConnectionProfile | ForEach-Object {
    Write-Host "SSID: $($_.Name)"
    Write-Host "Interface: $($_.InterfaceAlias)"
    Write-Host "-------------------------"
}
