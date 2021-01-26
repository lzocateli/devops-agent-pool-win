FROM mcr.microsoft.com/windows/servercore:ltsc2016-amd64

LABEL maintainer="Lincoln Zocateli <lzocateli00@outlook.com>" \
    org.label-schema.description="Azure DevOps agent build with base Windows Server Core" \
    org.label-schema.name="devops-agent-pool-win" \
    org.label-schema.url="https://github.com/lzocateli00" \
    org.label-schema.vcs-url="https://github.com/lzocateli00/devops-agent-pool-win/tree/main" \
    org.label-schema.usage="https://github.com/lzocateli00/devops-agent-pool-win/blob/main/README.md" \
    org.label-schema.vendor="Lincoln Zocateli" \
    org.label-schema.version="v1.0.0" \
    org.label-schema.schema-version="1.0.0" \
    org.label-schema.docker.cmd="docker run --name devops-agent-win \
    -d \
    -e VS_TENANT=your vsts tenant \
    -e AGENT_PAT=your vsts PAT \
    -e AGENT_POOL=your vsts pool \
    --volume=/var/run/docker.sock:/var/run/docker.sock \
    -v /home/my dir/teste:/vsts-agent-pool/_works \
    lzocateli/azdv-agent-win:vX.Y.Z " \
    org.label-schema.docker.cmd.test="docker run --name devops-agent-win \
    -ti \
    -e VS_TENANT=your vsts tenant \
    -e AGENT_PAT=your vsts PAT \
    -e AGENT_POOL=your vsts pool \
    --rm \
    --volume=/var/run/docker.sock:/var/run/docker.sock \
    -v /home/my dir/teste:/vsts-agent-pool/_works \
    lzocateli/azdv-agent-win:vX.Y.Z "


WORKDIR /azp

COPY start.ps1 .

CMD powershell .\start.ps1
