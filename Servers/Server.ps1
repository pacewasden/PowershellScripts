# Define an HTTP listener
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:8080/")

# Start the listener
$listener.Start()

# Handle incoming requests
while ($listener.IsListening) {
    $context = $listener.GetContext()
    $response = $context.Response
    $content = [System.Text.Encoding]::UTF8.GetBytes("Hello, World!")
    $response.OutputStream.Write($content, 0, $content.Length)
    $response.Close()
}

# Stop the listener (you might want to handle this more gracefully)
$listener.Stop()
