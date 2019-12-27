cls

Set-ExecutionPolicy Unrestricted

$features = @(
"NET-Framework-45-ASPNET",
"NET-Framework-45-Core",
"NET-Framework-45-Features",
"NET-Framework-Core",
"NET-Framework-Features",
"NET-WCF-Services45",
"NET-WCF-TCP-Activation45",
"NET-WCF-TCP-PortSharing45",
"WAS",
"WAS-Config-APIs",
"WAS-Process-Model",
"Web-App-Dev",
"Web-AppInit",
"Web-ASP",
"Web-Asp-Net",
"Web-Asp-Net45",
"Web-CGI",
"Web-Common-Http",
"Web-Custom-Logging",
"Web-DAV-Publishing",
"Web-Default-Doc",
"Web-Dir-Browsing",
"Web-Filtering",
"Web-Health",
"Web-Http-Errors",
"Web-Http-Logging",
"Web-Http-Redirect",
"Web-Http-Tracing",
"Web-ISAPI-Ext",
"Web-ISAPI-Filter",
"Web-Log-Libraries",
"Web-Mgmt-Console",
"Web-Mgmt-Service",
"Web-Mgmt-Tools",
"Web-Net-Ext",
"Web-Net-Ext45",
"Web-ODBC-Logging",
"Web-Performance",
"Web-Request-Monitor",
"Web-Scripting-Tools",
"Web-Security",
"Web-Server",
"Web-Stat-Compression",
"Web-Static-Content",
"Web-WebServer"
)
Add-WindowsFeature $features -Verbose


if(Get-Website -Name "Default Web Site")

{
    Remove-WebSite -Name "Default Web Site"
}

New-WebAppPool SampleAppPool -Force
Start-WebAppPool -Name SampleAppPool

New-WebSite -Name SampleAppSite -Port 80 -PhysicalPath "C:\inetpub\wwwroot" -ApplicationPool SampleAppPool  -Force
Start-WebSite -Name "SampleAppSite"


Expand-Archive -Path "$PSScriptRoot\aspnet-get-started.zip" -DestinationPath "$PSScriptRoot\temp"

Copy-Item -Path "$PSScriptRoot\temp\Content\d_C\a\1\s\aspnet-get-started\obj\Release\Package\PackageTmp\*" -Destination C:\inetpub\wwwroot -Recurse -Force
