# This script will search all of the C drive, requires admin access and honestly does not work that well 
# With all the errors
Get-ChildItem -Path C:\ -File -Recurse | Sort-Object Length -Descending | Select-Object -First 1
# This is a more specific path and it worked quicker. There is room for modification
# To narrow the scope and have it list all the files possible. 
Get-ChildItem -Path 'C:\Users\"username"\OneDrive\Desktop' -File -Recurse | Sort-Object Length -Descending | Select-Object -First 1
