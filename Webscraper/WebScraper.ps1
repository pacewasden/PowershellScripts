# Specify the URL of the web page you want to scrape
$url = "https://ksl.com"

# Use Invoke-WebRequest to download the HTML content of the web page
$response = Invoke-WebRequest -Uri $url

# Parse the HTML content using regex or other methods
# For example, extracting all links from the page
$links = $response.AllElements | Where-Object { $_.tagName -eq "a" } | ForEach-Object { $_.href }

# Display the extracted links
$links
