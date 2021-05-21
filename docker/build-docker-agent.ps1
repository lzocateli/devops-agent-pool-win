# https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/docker?view=azure-devops#windows

[CmdletBinding()] 
param(
    [Parameter(Position = 0, Mandatory, ValueFromPipeline)]
    [string] $dockerId,
    [Parameter(Position = 1, ValueFromPipeline)]
    [string] $dockerToken
)

Clear-Host

$localScript = $MyInvocation.MyCommand.Source.Replace($MyInvocation.MyCommand.Name, "")
$scriptName = $MyInvocation.MyCommand.Name
Write-Host "Start script: $localScript$scriptName at: $(Get-Date)"

if ([string]::IsNullOrWhiteSpace($dockerToken)) {
    docker login -u $dockerId --password-stdin

    Set-Location ./image-win/
    ./build-docker-image.ps1 -dockerId $dockerId
    Set-Location ../image-agent/
    ./build-docker-image.ps1 -dockerId $dockerId
}
else {
    docker login -u $dockerId -p $dockerToken
    
    Set-Location ./image-win/
    ./build-docker-image.ps1 -dockerId $dockerId -dockerToken $dockerToken
    Set-Location ../image-agent/
    ./build-docker-image.ps1 -dockerId $dockerId -dockerToken $dockerToken
}
