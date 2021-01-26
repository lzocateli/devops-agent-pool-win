# [CmdletBinding()] 
# param(
#   [Parameter(Position = 0, Mandatory, ValueFromPipeline)]
#   [string]$pathAgent
# )

$pathAgent = "$PWD/.credentials" 

Write-Host "Starting: $($MyInvocation.MyCommand.Definition)"

if (-not (Test-Path $pathAgent)) {
  Write-Host "Configuring agent...."
  . $pathAgent/configureAndRun.ps1
}
else {
  Write-Host "Executing background agent...."
  . $pathAgent/runAgent.ps1
}

