#Esse script esta sendo executado dentro do container
[CmdletBinding()] 
param(
  [Parameter(Position = 0, Mandatory, ValueFromPipeline)]
  [string]$pathAgent = "C:\agent"
)


Write-Host "Starting: $($MyInvocation.MyCommand.Definition)"


New-Item $pathAgent -ItemType directory | Out-Null
  
Set-Location $pathAgent
$destinationPack = "$(Get-Location)\agent.zip"
  
Write-Host "Downloading Azure Pipelines agent... $destinationPack" -ForegroundColor Cyan

$agentVersion = "2.181.0"
Invoke-WebRequest -Uri "https://vstsagentpackage.azureedge.net/agent/$agentVersion/vsts-agent-win-x64-$agentVersion.zip" `
                  -OutFile $destinationPack

Expand-Archive -Path $destinationPack -DestinationPath "$pathAgent/"

Remove-Item -Path $destinationPack
