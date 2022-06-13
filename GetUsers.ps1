$ClientID = "e401f1c5-4ab1-4223-8f04-a66773c343b3"
$ClientSecret = "mZ2t4h-6PN2I-yx9N08Oa46-2r_~8tn_S4"
$TenantId = "954b85f3-4cec-4c5e-8c38-fbb8af4e76ad"

 

$Body = @{client_id=$ClientID;client_secret=$ClientSecret;grant_type="client_credentials";scope="https://graph.microsoft.com/.default";}
$OAuthReq = Invoke-RestMethod -Method Post -Uri https://login.microsoftonline.com/$TenantId/oauth2/v2.0/token -Body $Body
$AccessToken = $OAuthReq.access_token

 

$Result = @()
$ApiUrl = 'https://graph.microsoft.com/v1.0/users?$top=999&$select=userprincipalname,onpremisesuserprincipalname'
$Response = Invoke-RestMethod -Headers @{Authorization = "Bearer $AccessToken"} -Uri $ApiUrl -Method Get
$Users = $Response.value # | where onpremisesuserprincipalname -ne $null
$Result = $Users

 

While ($Response.'@odata.nextLink' -ne $null) {
    $Response = Invoke-RestMethod -Headers @{Authorization = "Bearer $AccessToken"} -Uri $Response.'@odata.nextLink' -Method Get
    $Users = $Response.value # | where onpremisesuserprincipalname -ne $null
    $Result += $Users
}
$Result | Format-Table -Wrap -Autosize
$Result | Clip
$Result