# Https in .NET Core

This is a demo repository for my [blog post](http://craftsmanatwork.guru/-net-core-playing-with-https/).

## Create Certificate

Either launch these commands
``` 
$cert = New-SelfSignedCertificate -Subject localhost -DnsName localhost -FriendlyName ".NET Core dev certificate" -KeyUsage DigitalSignature -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.1") 
Export-Certificate -Cert $cert -FilePath dotnet.core.dev.cer
Import-Certificate -FilePath dotnet.core.dev.cer -CertStoreLocation cert:/CurrentUser/Root
```

or execute the PowerShell script provided in this repo

```
./create.certificate.ps
```

##Consume Certificate

### IIS

Will be available among provided certificates in "Binding" section


### Kestrel

Via kestrel options configuration:

```csharp
 var host = new WebHostBuilder()
                .UseKestrel(options => {
                    var cr = new X509Certificate2("./Certificates/dotnet.core.dev.cer");
                    options.UseHttps(cr);
                })
```