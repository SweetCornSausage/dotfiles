# 安装
linux使用自带的包管理器  
版本过低自己编译  
Windows https://github.com/vim/vim-win32-installer  
下载runtime，解压到安装目录  
下载python3 (ruby/perl/lua) 的库，解压到安装目录  

# Linux下自己编译
## 下载vim源代码
```bash
git clone https://github.com/vim/vim.git
```
## 删除原来的vim和配置文件
```bash
rpm -qa | grep vim
sudo apt purge vim vim-runtime vim-tiny vim-common vim-scripts vim-doc
find / -name "*vim*"
```
## yun
```bash
yum install ruby ruby-devel lua lua-devel \
ctags python python-devel \
python3 python3-devel tcl-devel \
perl perl-devel perl-ExtUtils-ParseXS \
perl-ExtUtils-CBuilder \
perl-ExtUtils-Embed ncurses-devel gtk2-devel
# libX*不能zsh安装
```
## apt
```bash
sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev ctags
```
## 编译
```bash
./configure --with-features=huge \
    --enable-fontset \
    --enable-multibyte \
    --enable-rubyinterp=yes \
    --enable-python3interp=yes \
    --with-python-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu \
    --enable-perlinterp=yes \
    --enable-luainterp=yes \
    --enable-gui=gtk2 \
    --enable-cscope \
    --prefix=/usr/local
# python自改地址(例如/usr/lib64/python3.6/config)
make
sudo make install
# 在/etc/bashrc末尾添加(一般不用加)
export PATH=/usr/local/vim/bin:$PATH
```

# 中文文档
详见 https://github.com/yianwillis/vimcdoc  
可以plug装插件解决了  

# 自定义配置
```vim
" 在vim配置文件中
source /path/to/init.vim
```