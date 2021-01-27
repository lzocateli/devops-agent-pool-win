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
    org.label-schema.docker.cmd="docker run --name devops-agent-pool-win \
    -d \
    -e AZP_URL=https://dev.azure.com/your_subscription/ \
    -e AZP_TOKEN=your PAT \
    -e AZP_POOL=your agent pool name \
    -e AZP_AGENT_NAME=your agent name \
    -e AZP_WORK=_work \
    -v D:/UserData/dk-agent-01:C:/agent \
    lzocateli/devops-agent-pool-win:X.Y.Z " \
    org.label-schema.docker.cmd.test="docker run --name devops-agent-pool-win \
    -ti \
    -e AZP_URL=https://dev.azure.com/your_subscription/ \
    -e AZP_TOKEN=your PAT \
    -e AZP_POOL=your agent pool name \
    -e AZP_AGENT_NAME=your agent name \
    -e AZP_WORK=_work \
    --rm \
    -v D:/UserData/dk-agent-01:C:/agent \
    lzocateli/devops-agent-pool-win:latest "


WORKDIR /devops-agent-pool-win

# RUN git clone -b main https://github.com/lzocateli00/devops-agent-pool-win.git \
#  && cp ./devops-agent-pool-win/agent/*.ps1 . \
#  && rm -r devops-agent-pool-win 

# RUN ./install-agent.ps1 C:/agent

# CMD ["/devops-agent-pool-win/ConfigureOrRun.ps1 C:/agent"]
CMD [ "powershell" ]