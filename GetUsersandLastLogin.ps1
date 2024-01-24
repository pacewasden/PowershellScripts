Get-WinEvent -LogName Security | Where-Object {($_.Id -eq 4624) -and ($_.Level -eq 0)} | Select-Object TimeCreated, @{Name='User';Expression={$_.Properties[5].Value}}
