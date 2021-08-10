New-Item -Path "c:\" -Name "certfolder" -ItemType "directory"

Invoke-WebRequest -Uri ''  -OutFile 'C:\certfolder\cert.pfx'



$password1 = 'password'

$securedString = ConvertTo-SecureString -String $password1 -Force -AsPlainText

$Certinfo = Import-PfxCertificate -FilePath C:\certfolder\cert.pfx -CertStoreLocation Cert:\LocalMachine\webhosting -Password $securedString


$thumbprint = $Certinfo.Thumbprint

Remove-IISSiteBinding -Name "Default Web Site" -Protocol "https" -BindingInformation "*:443:" -confirm:$false

New-IISSiteBinding -Name "Default Web Site" -BindingInformation "*:443:" -CertificateThumbPrint $thumbprint -CertStoreLocation "Cert:\LocalMachine\Webhosting" -Protocol https

iisreset