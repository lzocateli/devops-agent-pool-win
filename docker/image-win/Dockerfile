# escape=`

ARG REPO=mcr.microsoft.com/windows/servercore
FROM $REPO:ltsc2016-amd64

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

ENV NO_PROXY=yourdns.com HTTP_PROXY=http://proxy.yourdns.com:80 HTTPS_PROXY=http://proxy.yourdns.com:80

RUN Start-Process powershell -Verb runAs; `
    Set-ExecutionPolicy Bypass -Scope Process -Force; `
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))


RUN Start-Process powershell -Verb runAs; `
    Enable-PSRemoting -Force; `
    choco install poshgit -y

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
