$volatileEnvPath = "HKCU:\Volatile Environment"

if (Test-Path $volatileEnvPath){
    $volatileEnvPath = Get-ItemProperty -Path $volatileEnvPath

    Write-Host "Volatile Enviroment Variables:" -ForegroundColor Green
    foreach ($item in $volatileEnvPath.PSObject.Properties){
        Write-Host "$($item.name): $($item.value)"
    }
} else {
    Write-Host "The volatile enviroment registry key does not exist" -ForegroundColor Red
}

