$cert = New-SelfSignedCertificate -Subject localhost -DnsName localhost -FriendlyName ".NET Core dev certificate" -KeyUsage DigitalSignature -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.1") 
Export-Certificate -Cert $cert -FilePath dotnet.core.dev.cer
Import-Certificate -FilePath dotnet.core.dev.cer -CertStoreLocation cert:/CurrentUser/Root