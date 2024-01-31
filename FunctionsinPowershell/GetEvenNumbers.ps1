Function Get-EvenNumbers {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline=$true)]
        [int]$Number
    )

    process {
        if ($Number % 2 -eq 0) {
            Write-Output "$Number is even."
        } else {
            Write-Output "$Number is odd."
        }
    }
}

# Example usage with pipeline
1..10 | Get-EvenNumbers
