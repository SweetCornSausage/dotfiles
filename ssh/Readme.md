# 安装
## Linux
包管理器直接装  
## windows
“设置”>“应用”>“应用和功能”>“管理可选功能”(>“添加功能”)  

# 启动
## linux
```bash
systemctl enable sshd.service
```
## Windows
服务设置openssh相关的服务为自动  
## ssh连接到powershell  
```
New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -PropertyType String -Force
```

# 配置文件
## Linux
```
/etc/ssh/sshd_config
```
## windows
```
C:\ProgramData\ssh\sshd_config
```
## 配置
```conf
Port 22 #默认端口
PubkeyAuthentication yes #允许密钥方式登录
PasswordAuthentication yes #允许用户名密码方式登录
AuthorizedKeysFile	.ssh/authorized_keys #使用的公钥
# windows限定
#Match Group administrators
#       AuthorizedKeysFile __PROGRAMDATA__/ssh/administrators_authorized_keys
#上两行注释掉,不然~/.ssh/authorized_keys不能用
```

# 密钥
## 生成
```bash
ssh-keygen [-t rsa]
```
## 公钥
服务端接收客户端的公钥id_rsa.pub  
```bash
ssh-copy-id -i .ssh/id_rsa.pub 用户名@服务端
```
## 私钥
客户端接收服务端的私钥id_rsa  
```bash
ssh-add ~/.ssh/id_dsa
```

# 权限问题
## windows
现在好像不需要了  
私钥:只有当前用户的完全控制  
公钥:system和administrator的完全控制  
```bat
icacls authorized_keys /inheritance:r //删除当前用户
icacls authorized_keys /grant SYSTEM:(F) //加入system的完全控制
icacls authorized_keys /grant BUILTIN\Administrators:(F)
```
## linux的ssh的权限问题
```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
# 注意HOME目录如果被设置为其它用户和组用户可以写，那么即时你更改了.ssh目录和authorized_keys文件也解决不了问题！
```

# known_hosts
```
手动删除修改known_hsots里面的内容
或
~/.ssh/config 加 
StrictHostKeyChecking no 
UserKnownHostsFile /dev/null 
```
