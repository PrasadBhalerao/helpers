
$sSecStrPassword = "Virusadmin55~!";       #update password here
$FilePath = "c:\a\"                        #update directory path here
$FileName = "upscert"                      #update certificate name here
$FileType = ".pfx"
$certificateObject = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2
$certificateObject.Import($FilePath+$FileName+$FileType, $sSecStrPassword, [System.Security.Cryptography.X509Certificates.X509KeyStorageFlags]::DefaultKeySet)
return $certificateObject.Thumbprint