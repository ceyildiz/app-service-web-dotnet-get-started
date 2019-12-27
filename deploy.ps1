Expand-Archive -Path "$PSScriptRoot\aspnet-get-started.zip" -DestinationPath "$PSScriptRoot\temp"

Copy-Item -Path "$PSScriptRoot\temp\Content\d_C\a\1\s\aspnet-get-started\obj\Release\Package\PackageTmp\*" -Destination C:\inetpub\wwwroot -Recurse -Force
