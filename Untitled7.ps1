Connect-AzureAD


#$ThisUser = Get-AzureADUser -ObjectId 28c189e8-cffd-4d2a-8c5b-958416173a88



#$ThisUser = Get-ADUser -Identity $User -Properties extensionAttribute1
  #  Set-ADUser –Identity $ThisUser -add @{"extensionattribute1"="MyString"}


    #Set-Mailbox AugUser1@QALOADOffice365.onmicrosoft.com -CustomAttribute1 "AugUser1Test@13ex.local"


#$user = Get-AzureADUser -ObjectId 28c189e8-cffd-4d2a-8c5b-958416173a88 -Properties extensionAttribute1

#Set-AzureADUser –Identity $user -Clear "extensionAttribute1"

#Set-AzureADUser -Identity $user -Add @{extensionAttribute1 = "AugUser1Test@13ex.local"}

$id = "AugUser1@QALOADOffice365.onmicrosoft.com";
#$user = Get-AzureADUser -ObjectId $id
#Set-AzureADUser -ObjectId $id -ExtensionAttribute1 "AugUser1Test@13ex.local"

#Set-AzureADUserExtension -ObjectId $user.ObjectId -ExtensionName extensionAttribute1 -ExtensionValue "AugUser1Test@13ex.local"

#$user

#Get-EXOMailbox -Identity $id #-Properties DisplayName,EmailAddresses,Alias


$id = "CreatedOnprem6.Test@13exch01.com";
Get-Mailbox -Identity $id -RemoteArchive

