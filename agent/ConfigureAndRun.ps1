#Esse script esta sendo executado dentro do container
[CmdletBinding()] 
param(
  [Parameter(Position = 0, Mandatory, ValueFromPipeline)]
  [string]$pathAgent = "C:\agent"
)


Write-Host "Starting: $($MyInvocation.MyCommand.Definition)"

if (-not (Test-Path $pathAgent)) {
    Write-Host "Path agent: $pathAgent not found"
    Exit 1
}


Write-Host "Stopping Agent.Listener ..."
Write-Host "$(Get-Process -Name "Agent.Listener")"
#Stop-Process -Name "Agent.Listener"


Write-Host "Starting configuration for $env:COMPUTERNAME ...  in $pathAgent"
./ConfigureAgent.ps1 $pathAgent


Write-Host "Configuration done. Starting run for $env:COMPUTERNAME ...  in $pathAgent"
./RunAgent.ps1 $pathAgent