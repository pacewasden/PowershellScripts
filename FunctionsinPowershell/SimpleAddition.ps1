Function Get-Sum {
    param (
        [Parameter(Mandatory=$true)]
        [int]$Number1,

        [Parameter(Mandatory=$true)]
        [int]$Number2
    )

    $Sum = $Number1 + $Number2
    return $Sum
}

# Call the function
$result = Get-Sum -Number1 5 -Number2 10
Write-Host "The sum is: $result"

