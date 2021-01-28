# Instalacao do nodejs pelo choco causa erro porque o instalador msi do windows
# nao funciona no Windows Server Core
######## NAO FOI NECESSARIo INSTALAR NODEJS, O PROPRIO AGENT JÁ FAz ISSO #####

Write-Host "Starting: $($MyInvocation.MyCommand.Definition)"


$pathNode = "c:/UserApps"
mkdir $pathNode

$nodeVersion = "v14.15.4"

Write-Host "Downloading $nodeVersion ..."

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest `
    -Uri "https://nodejs.org/dist/$nodeVersion/node-$nodeVersion-win-x64.zip" `
    -OutFile $pathNode/nodejs.zip

Expand-Archive -Path $pathNode/nodejs.zip -DestinationPath $pathNode

Rename-Item -Path $pathNode/node-$nodeVersion-win-x64 -NewName $pathNode/nodejs
Remove-Item -Path $pathNode/nodejs.zip

Start-Process powershell -Verb runAs
$path = [Environment]::GetEnvironmentVariable('PSModulePath', 'Machine')
$newpath = $path + ';$pathNode/nodejs'
[Environment]::SetEnvironmentVariable("PSModulePath", $newpath, 'Machine')

$path = [Environment]::GetEnvironmentVariable('PSModulePath', 'User')
$newpath = $path + ';$APPDATA/npm'
[Environment]::SetEnvironmentVariable("PSModulePath", $newpath, 'User')