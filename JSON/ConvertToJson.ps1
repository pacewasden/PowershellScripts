$data = @{
    Name = "John"
    Age = 25
    City = "Salt Lake City"
}

$jsonString = $data | ConvertTo-Json

Write-Output $jsonString