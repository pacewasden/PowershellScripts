# Specify the root directory where you want to search for XML files
$rootDirectory = "C:\Users\"

# Search for XML files recursively in the specified directory
$xmlFiles = Get-ChildItem -Path $rootDirectory -Recurse -Filter *.xml

# Display the full path of each XML file found
foreach ($xmlFile in $xmlFiles) {
    Write-Host $xmlFile.FullName
    # You can perform additional actions here if needed
}
