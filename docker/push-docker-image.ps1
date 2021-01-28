# https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/docker?view=azure-devops#windows

[CmdletBinding()] 
param(
    [Parameter(Position = 0, Mandatory, ValueFromPipeline)]
    [string]$dockerId,
    [Parameter(Position = 1, Mandatory, ValueFromPipeline)]
    [string]$dockerToken
)

Clear-Host

docker login -u $dockerId -p $dockerToken

$imageName = "devops-agent-pool-win"
$imageTag = "1.0.0"
$DockerBuildTag = "$dockerId/${imageName}:$imageTag"

docker push $DockerBuildTag
