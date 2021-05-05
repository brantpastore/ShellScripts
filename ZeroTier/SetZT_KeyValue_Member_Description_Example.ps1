[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$token = TOKENHERE

$Description = "Test Success"

$BaseUrl = "https://my.zerotier.com/api/network/"
$NetworkURL = "<NETWORK ID HERE>/member/"
$MemberURL = "<NODE ID HERE>"

$FinalURL = $BaseUrl + $NetworkURL + $MemberURL

$Body = @"
{
    "description": "$Description"
}
"@


$Headers = @{
    Authorization="Bearer $token"
}

$responseData = (Invoke-WebRequest -Uri $FinalURL -Method POST -Headers $Headers -UseBasicParsing -Body $Body -ContentType "application/json").Content | ConvertTo-Json


Write-Host $responseData