# API Testing Tool Script

# Define API endpoint and request method
$apiEndpoint = "https://jsonplaceholder.typicode.com/posts/1" # Replace with your API endpoint
$requestMethod = "GET" # Change to POST, PUT, DELETE, etc., as needed

# Optional: Define headers and body for POST/PUT requests
$headers = @{
    "Content-Type" = "application/json"
    "Authorization" = "Bearer YOUR_ACCESS_TOKEN" # Replace with your token if required
}
$body = @{
    title = "foo"
    body  = "bar"
    userId = 1
} | ConvertTo-Json

# Make API call
try {
    if ($requestMethod -eq "GET") {
        $response = Invoke-RestMethod -Uri $apiEndpoint -Method GET -Headers $headers
    } else {
        $response = Invoke-RestMethod -Uri $apiEndpoint -Method $requestMethod -Headers $headers -Body $body
    }

    # Output response
    Write-Output "Response Status: Success"
    Write-Output $response
}
catch {
    # Error handling
    Write-Output "Error: $_"
}
