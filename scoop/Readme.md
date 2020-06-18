# 安装scoop
## 设置路径(在安装之前)
```ps1
# 当前用户
$env:SCOOP='D:\Scoop'
[Environment]::SetEnvironmentVariable('SCOOP', $env:SCOOP, 'User')
# 全局
$env:SCOOP_GLOBAL='D:\GlobalScoopApps'
[Environment]::SetEnvironmentVariable('SCOOP_GLOBAL', $env:SCOOP_GLOBAL, 'Machine')
```
## 安装
```ps1
# Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
iwr -useb get.scoop.sh | iex
```

# 配置scoop
## 配置文件
文件位于 ~/.config/scoop/config.json
## 代理(http)
```json
"proxy":  "127.0.0.1:10809"
```
## aria2
```json
"aria2-enabled":  false,
"aria2-retry-wait":  5,
"aria2-split":  16,
"aria2-min-split-size":  "5M",
```

# scoop-completion
```ps1
scoop install scoop-completion
Import-Module "$($(Get-Item $(Get-Command scoop).Path).Directory.Parent.FullName)\modules\scoop-completion"
```