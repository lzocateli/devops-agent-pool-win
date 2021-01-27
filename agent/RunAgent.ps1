#Esse script esta sendo executado dentro do container
[CmdletBinding()] 
param(
  [Parameter(Position = 0, Mandatory, ValueFromPipeline)]
  [string]$pathAgent = "C:\agent"
)

Write-Host "Starting: $($MyInvocation.MyCommand.Definition)"

[Environment]::SetEnvironmentVariable("AZP_TOKEN", '')


Set-Location $pathAgent
    
Write-Host "Executing run.cmd in $PWD ..."

./run.cmd
