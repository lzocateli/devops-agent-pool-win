#Esse script esta sendo executado dentro do container

$localScript = $MyInvocation.MyCommand.Source.Replace($MyInvocation.MyCommand.Name, "")
$scriptName = $MyInvocation.MyCommand.Name
Write-Host "Start script: $localScript$scriptName at: $(Get-Date)"
  
Write-Host "Donwloading and install az devops"
az extension add --name azure-devops
az extension list
