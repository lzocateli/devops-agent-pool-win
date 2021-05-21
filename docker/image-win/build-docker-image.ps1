# https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/docker?view=azure-devops#windows

[CmdletBinding()] 
param(
    [Parameter(Position = 0, ValueFromPipeline)]
    [string] $dockerId,
    [Parameter(Position = 1, ValueFromPipeline)]
    [string] $dockerToken
)

Clear-Host

$localScript = $MyInvocation.MyCommand.Source.Replace($MyInvocation.MyCommand.Name, "")
$scriptName = $MyInvocation.MyCommand.Name
Write-Host "Start script: $localScript$scriptName at: $(Get-Date)"


$fileToCheck = "Dockerfile"
if (-not (Test-Path $fileToCheck -PathType leaf)) {
    Write-Error "error: $fileToCheck not exists in $PWD"
    exit 1
}

if ($false -eq [string]::IsNullOrWhiteSpace($dockerId)) {
    if ([string]::IsNullOrWhiteSpace($dockerToken)) {
        docker login -u $dockerId --password-stdin
    }
    else {
        docker login -u $dockerId -p $dockerToken
    }
}

# docker pull lzocateli/devops-agent-pool-win:1.0.0
$imageName = "devops-winbase"
$imageTag = "1.0.0"
$DockerBuildT = "$dockerId/${imageName}:$imageTag"


docker build -t $DockerBuildT .
    
docker images

