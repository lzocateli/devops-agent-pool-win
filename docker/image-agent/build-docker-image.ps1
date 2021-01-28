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


$BuildDate = date -u +"%Y-%m-%dT%H:%M:%SZ"
$GitUrl = git config --get remote.origin.url
$GitCommit = git rev-parse --short HEAD
$CodeVersion = "1.0.0"
$imageName = "devops-agent-pool-win"
$imageTag = "1.0.0"



docker images

Write-Host "Enter para enviar a imagem para o hub ou CTRL+C para parar"
pause

docker tag "$dockerId/$imageName:$imageTag" "$dockerId/$imageName:latest"

docker push "$dockerId/$imageName:$imageTag" 
docker push "$dockerId/$imageName:latest"
