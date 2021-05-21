#Esse script esta sendo executado dentro do container

$localScript = $MyInvocation.MyCommand.Source.Replace($MyInvocation.MyCommand.Name, "")
$scriptName = $MyInvocation.MyCommand.Name
Write-Host "Start script: $localScript$scriptName at: $(Get-Date)"
  

$scriptAzureCLI = {

  Write-Host "Donwloading and install AzureCLI"

  Invoke-WebRequest `
    -Uri https://aka.ms/installazurecliwindows `
    -OutFile .\AzureCLI.msi; Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm .\AzureCLI.msi

}

$scriptAzDevOps = {
  
  Write-Host "Donwloading and install az devops"
  
  az extension add --name azure-devops
  az extension list

}

#$so = New-PSSessionOption -SkipCACheck -IdleTimeout 7200000 -OperationTimeout 0 -OutputBufferingMode Block
#$s = New-PSSession -ComputerName $serverName -SessionOption $so 
$s = New-PSSession –RunAsAdministrator

Invoke-Command -Session $s -ScriptBlock $scriptAzureCLI
Invoke-Command -Session $s -ScriptBlock $scriptAzDevOps

Pause