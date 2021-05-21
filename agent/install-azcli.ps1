#Esse script esta sendo executado dentro do container

$localScript = $MyInvocation.MyCommand.Source.Replace($MyInvocation.MyCommand.Name, "")
$scriptName = $MyInvocation.MyCommand.Name
Write-Host "Start script: $localScript$scriptName at: $(Get-Date)"
  

$scriptAzureCLI = {

  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
  Invoke-WebRequest `
  -Uri https://aka.ms/installazurecliwindows `
  -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; #rm .\AzureCLI.msi
  
}

$scriptAzDevOps = {
  
  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
  az extension add --name azure-devops
  az extension list >azdevops.log
  
}


Write-Host "Donwloading and install AzureCLI ..."
$procAzCli = Start-Process powershell -ArgumentList "-noexit -command (Invoke-Command -ScriptBlock {$scriptAzureCLI})" -Verb runAs -Wait
Write-Host "AzCli exit code: $($procAzCli.ExitCode)"

Write-Host "Donwloading and install az devops ..."
$procAzDvo = Start-Process powershell -ArgumentList "-noexit -command (Invoke-Command -ScriptBlock {$scriptAzDevOps})" -Verb runAs -Wait
Write-Host "AzDevOps exit code: $($procAzDvo.ExitCode)"
