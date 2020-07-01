# 运行脚本
```ps1
Set-ExecutionPolicy Unrestricted
# Restricted——默认的设置， 不允许任何script运行
# AllSigned——只能运行经过数字证书签名的script
# RemoteSigned——运行本地的script不需要数字签名，但是运行从网络上下载的script就必须要有数字签名
# Unrestricted——允许所有的script运行
```

# 配置
## 配置文件
```ps1
$PROFILE
# ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
New-Item -ItemType file -Path $PROFILE  -Force
```
## utf-8编码
```ps1
[System.Console]::OutputEncoding=[System.Text.Encoding]::GetEncoding(65001)
```
## 设置代理(http)
```ps1
# Set-Proxy command
Function SetProxy() {
    Param(
        $Addr = $null,
        [switch]$ApplyToSystem
    )
    
    $env:HTTP_PROXY = $Addr;
    $env:HTTPS_PROXY = $Addr; 
    $env:http_proxy = $Addr;
    $env:https_proxy = $Addr;

    if ($addr -eq $null) {
        [Net.WebRequest]::DefaultWebProxy = New-Object Net.WebProxy;
        if ($ApplyToSystem) { SetSystemProxy $null; }
        Write-Output "Successful unset all proxy variable";
    }
    else {
        [Net.WebRequest]::DefaultWebProxy = New-Object Net.WebProxy $Addr;
        if ($ApplyToSystem) {
            $matchedResult = ValidHttpProxyFormat $Addr;
            # Matched result: [URL Without Protocol][Input String]
            if (-not ($matchedResult -eq $null)) {
                SetSystemProxy $matchedResult.1;
            }
        }
        Write-Output "Successful set proxy as $Addr";
    }
}
Function SetSystemProxy($Addr = $null) {
    Write-Output $Addr
    $proxyReg = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings";

    if ($Addr -eq $null) {
        Set-ItemProperty -Path $proxyReg -Name ProxyEnable -Value 0;
        return;
    }
    Set-ItemProperty -Path $proxyReg -Name ProxyServer -Value $Addr;
    Set-ItemProperty -Path $proxyReg -Name ProxyEnable -Value 1;
}
Function ValidHttpProxyFormat ($Addr) {
    $regex = "(?:https?:\/\/)(\w+(?:.\w+)*(?::\d+)?)";
    $result = $Addr -match $regex;
    if ($result -eq $false) {
        throw [System.ArgumentException]"The input $Addr is not a valid HTTP proxy URI.";
    }

    return $Matches;
}
Set-Alias set-proxy SetProxy
# SetProxy 'http://127.0.0.1:10809'
```
## posh-git
```ps1
Install-Module posh-git -Scope CurrentUser
Import-Module posh-git
```
## oh-my-posh
```ps1
Install-Module oh-my-posh -Scope CurrentUser
Import-Module oh-my-posh
Set-Theme Paradox
```
## DirColors
```ps1
# Install-Module DirColors -Scope CurrentUser
Import-Module DirColors
```
## colortool
使用了dracula的安装脚本，记得改install.cmd里的配色文件
## pshazz
```ps1
scoop install pshazz
```
