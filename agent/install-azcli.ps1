#Esse script esta sendo executado dentro do container

$localScript = $MyInvocation.MyCommand.Source.Replace($MyInvocation.MyCommand.Name, "")
$scriptName = $MyInvocation.MyCommand.Name
Write-Host "Start script: $localScript$scriptName at: $(Get-Date)"
  

$scriptAzureCLI = {

  Invoke-WebRequest `
  -Uri https://aka.ms/installazurecliwindows `
  -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi
  
}

$scriptAzDevOps = {
  
  az extension add --name azure-devops
  az extension list
  
}


Write-Host "Donwloading and install AzureCLI"
Start-Process powershell -ArgumentList "-noexit -command (Invoke-Command -ScriptBlock {$scriptAzureCLI})" -Verb runAs 

Write-Host "Donwloading and install az devops"
Start-Process powershell -ArgumentList "-noexit -command (Invoke-Command -ScriptBlock {$scriptAzDevOps})" -Verb runAs 