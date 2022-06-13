$ClientID = "4d831212-5378-4979-b31f-862b5a46209d"
$ClientSecret = "gl4pT8B1dqZlN_CGu..Yuz4H.G.4iM30WZ"
$TenantId = "0e686d56-57e1-499c-8ff0-e4ca54615010"

 

$Body = @{client_id=$ClientID;client_secret=$ClientSecret;grant_type="client_credentials";scope="https://graph.microsoft.com/.default";}
$OAuthReq = Invoke-RestMethod -Method Post -Uri https://login.microsoftonline.com/$TenantId/oauth2/v2.0/token -Body $Body
$AccessToken = $OAuthReq.access_token

 

$Result = @()
$ApiUrl = 'https://graph.microsoft.com/v1.0/directory/deletedItems/microsoft.graph.user?$top=100&$select=userprincipalname,onpremisesuserprincipalname,id,EmailAddresses'
$Response = Invoke-RestMethod -Headers @{Authorization = "Bearer $AccessToken"} -Uri $ApiUrl -Method Get
$Users = $Response.value # | where onpremisesuserprincipalname -ne $null
$Result = $Users


 

While ($Response.'@odata.nextLink' -ne $null) {
    $Response = Invoke-RestMethod -Headers @{Authorization = "Bearer $AccessToken"} -Uri $Response.'@odata.nextLink' -Method Get
    $Users = $Response.value # | where onpremisesuserprincipalname -ne $null
    $Result += $Users
}
$Result