#Esse script esta sendo executado dentro do container

$localScript = $MyInvocation.MyCommand.Source.Replace($MyInvocation.MyCommand.Name, "")
$scriptName = $MyInvocation.MyCommand.Name
Write-Host "Start script: $localScript$scriptName at: $(Get-Date)"
  

Write-Host "Donwloading and install AzureCLI ..."

Start-Process powershell -Verb runAs; `
  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; `
  Invoke-WebRequest `
  -Uri https://aka.ms/installazurecliwindows `
  -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi
  

Write-Host "Donwloading and install az devops ..."

Start-Process powershell -Verb runAs; `
  az extension add --name azure-devops; `
  az extension list >azdevops.log;