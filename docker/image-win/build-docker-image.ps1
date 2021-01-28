# https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/docker?view=azure-devops#windows

[CmdletBinding()] 
param(
    [Parameter(Position = 0, Mandatory, ValueFromPipeline)]
    [string]$dockerId,
    [Parameter(Position = 1, Mandatory, ValueFromPipeline)]
    [string]$dockerToken
)

Clear-Host

$fileToCheck = "Dockerfile"
if (-not (Test-Path $fileToCheck -PathType leaf)) {
    Write-Error "error: $fileToCheck not exists in $PWD"
    exit 1
}

docker login -u $dockerId -p $dockerToken


$imageName = "devops-winbase"
$imageTag = "1.0.0"
$DockerBuildT = "$dockerId/${imageName}:$imageTag"


docker build -t $DockerBuildT .
    
docker images

