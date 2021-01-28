# escape=`

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
    
ARG REPO=lzocateli/devops-winbase
FROM $REPO:1.0.0

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

LABEL maintainer="Lincoln Zocateli <lzocateli00@outlook.com>" `
    org.label-schema.description="Azure DevOps agent build with base Windows Server Core" `
    org.label-schema.name="devops-agent-pool-win" `
    org.label-schema.url="https://github.com/lzocateli00" `
    org.label-schema.vcs-ref=$VCS_REF `
    org.label-schema.vcs-url="https://github.com/lzocateli00/devops-agent-pool-win" `
    org.label-schema.usage="https://github.com/lzocateli00/devops-agent-pool-win/blob/main/README.md" `
    org.label-schema.vendor="Lincoln Zocateli" `
    org.label-schema.version=$VERSION `
    org.label-schema.schema-version="1.0.0" `
    org.label-schema.build-date=$BUILD_DATE 

RUN Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\DOS Devices' `
    -Name 'G:' -Value "\??\C:\data" -Type String;

CMD ["powershell.exe", "-noexit", "-file", "ConfigureOrRun.ps1" ]
