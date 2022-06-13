$ClientID = "d3c368d8-051f-4272-aa15-5a8ab327ce51"
$ClientSecret = ".8647~QIk-FmyTioq9Dh00M6MG6e-q1a18"
$TenantId = "0d374894-564e-4d73-8598-6c25f0366c87"

 

$Body = @{client_id=$ClientID;client_secret=$ClientSecret;grant_type="client_credentials";scope="https://graph.microsoft.com/.default";}
$OAuthReq = Invoke-RestMethod -Method Post -Uri https://login.microsoftonline.com/$TenantId/oauth2/v2.0/token -Body $Body
$AccessToken = $OAuthReq.access_token

 

$Result = @()
$ApiUrl = 'https://graph.microsoft.com/v1.0/directory/deletedItems/microsoft.graph.user?$top=100&$select=userprincipalname,onpremisesuserprincipalname,id,ProxyAddresses'
$Response = Invoke-RestMethod -Headers @{Authorization = "Bearer $AccessToken"} -Uri $ApiUrl -Method Get
$Users = $Response.value # | where onpremisesuserprincipalname -ne $null
$Result = $Users


 

While ($Response.'@odata.nextLink' -ne $null) {
    $Response = Invoke-RestMethod -Headers @{Authorization = "Bearer $AccessToken"} -Uri $Response.'@odata.nextLink' -Method Get
    $Users = $Response.value # | where onpremisesuserprincipalname -ne $null
    $Result += $Users
}
$Result