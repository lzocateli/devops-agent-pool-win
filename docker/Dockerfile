# escape=`

ARG REPO=mcr.microsoft.com/windows/servercore
FROM $REPO:ltsc2016-amd64

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

LABEL maintainer="Lincoln Zocateli <lzocateli00@outlook.com>" `
    org.label-schema.description="Azure DevOps agent build with base Windows Server Core" `
    org.label-schema.name="devops-agent-pool-win" `
    org.label-schema.url="https://github.com/lzocateli00" `
    org.label-schema.vcs-url="https://github.com/lzocateli00/devops-agent-pool-win/tree/main" `
    org.label-schema.usage="https://github.com/lzocateli00/devops-agent-pool-win/blob/main/README.md" `
    org.label-schema.vendor="Lincoln Zocateli" `
    org.label-schema.version="v1.0.0" `
    org.label-schema.schema-version="1.0.0" 


ENV NO_PROXY=cat.com HTTP_PROXY=http://proxy.cat.com:80 HTTPS_PROXY=http://proxy.cat.com:80

RUN Start-Process powershell -Verb runAs; `
    Set-ExecutionPolicy Bypass -Scope Process -Force; `
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))


RUN Start-Process powershell -Verb runAs; `
    choco install poshgit -y

# RUN Start-Process powershell -Verb runAs; `
#     choco install nodejs -y
RUN [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; `
    mkdir c:/UserApps; `
    Set-Item -Path Env:nodeVersion -Value "v14.15.4"; `
    Invoke-WebRequest `
    -Uri "https://nodejs.org/dist/$($Env:nodeVersion)/node-$($Env:nodeVersion)-win-x64.zip" `
    -OutFile c:/UserApps/nodejs.zip; `
    Expand-Archive -Path c:/UserApps/nodejs.zip -DestinationPath c:/UserApps; `
    Rename-Item -Path c:/UserApps/node-$($Env:nodeVersion)-win-x64 -NewName c:/UserApps/nodejs; `
    Remove-Item -Path c:/UserApps/nodejs.zip; `
    c:/UserApps/nodejs/nodevars.bat; `
    node --version



WORKDIR /agent

RUN git config --global user.name 'CblDevOps'; ` 
    git config --global user.email CblDevOps@cat.com; `
    git config --global http.https://localhost.sslVerify false; `
    git config --global https.https://localhost.sslVerify false; `
    git clone -b main https://github.com/lzocateli00/devops-agent-pool-win.git `
    $HOME/devops-agent-pool-win; `
    cp $HOME/devops-agent-pool-win/agent/*.ps1 .; `
    rm -r $HOME/devops-agent-pool-win -Force;

RUN ./install-agent.ps1 $PWD

CMD ["powershell.exe", "-noexit", "-file", "ConfigureOrRun.ps1 $PWD" ]
