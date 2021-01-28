### Azure DevOps agent build with base Windows Server Core

## Supported

- [`scripts` (*agent-pool/scripts*)](https://github.com/lzocateli00/devops-agent-pool-win/tree/main/agent)
- [`docker` (*agent-pool/Dockerfile*)](https://github.com/lzocateli00/devops-agent-pool-win/tree/main/docker)

[![Downloads from Docker Hub](https://img.shields.io/docker/pulls/lzocateli/devops-agent-pool-win.svg)](https://registry.hub.docker.com/u/lzocateli/devops-agent-pool-win)
[![Stars on Docker Hub](https://img.shields.io/docker/stars/lzocateli/devops-agent-pool-win.svg)](https://registry.hub.docker.com/u/lzocateli/devops-agent-pool-win) 
[![](https://images.microbadger.com/badges/image/lzocateli/devops-agent-pool-win.svg)](https://microbadger.com/images/lzocateli/devops-agent-pool-win "Get your own image badge on microbadger.com")


## Configuration

For `agent`, you need to set these environment variables:

* `AZP_URL` - Required. The Azure DevOps organization
* `AZP_TOKEN` - Required. The personal access token PAT from Azure DevOps. 
* `AZP_POOL` - The agent pool. Optional. Default value: `Default`
* `AZP_AGENT_NAME` - Name of agent to be displayed in DevOps Agent Pool
* `AZP_WORK` - Folder where the build will be executed.  Default value: `_work`

## Running

On a Mac, use Docker for Mac, or directy on Linux, run in bash:

To start a container in detached mode:

````pwsh
docker run --name devops-agent-pool-win `
    -d `
    -e AZP_URL=https://dev.azure.com/your_subscription/ `
    -e AZP_TOKEN=your PAT `
    -e AZP_POOL=your agent pool name `
    -e AZP_AGENT_NAME=your agent name `
    -e AZP_WORK=G:\_work `
    -v D:/UserData/dk-agent-01:C:/data `
    lzocateli/devops-agent-pool-win:1.0.0 
````

To start a container in foreground mode:

````pwsh
docker run --name devops-agent-pool-win `
    -ti `
    -e AZP_URL=https://dev.azure.com/your_subscription/ `
    -e AZP_TOKEN=your PAT `
    -e AZP_POOL=your agent pool name `
    -e AZP_AGENT_NAME=your agent name `
    -e AZP_WORK=_work `
    --rm `
    -e AZP_WORK=G:\_work `
    -v D:/UserData/dk-agent-01:C:/data `
    lzocateli/devops-agent-pool-win:1.0.0 
````

The -v parameter indicates that a volume is being mounted on the container host, 
so it will be possible to keep the _work folder even if the container is not running.
If you do not want to use a volume on the host, just remove the -v line from docker run.

## Maintainers

* [email: Lincoln Zocateli](mailto:lzocateli00@outlook.com), [facebook: Lincoln Zocateli](https://www.facebook.com/lzocateli00), [twitter: @lzocateli00](https://twitter.com/lzocateli00)


