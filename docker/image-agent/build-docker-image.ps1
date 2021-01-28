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

$imageTag = "devops-agent-pool-win:1.0.0"

docker login -u $dockerId -p $dockerToken
docker build -t $dockerId/$imageTag .
docker images

Write-Host "Enter para enviar a imagem para o hub ou CTRL+C para parar"
pause

docker push $dockerId/$imageTag 
