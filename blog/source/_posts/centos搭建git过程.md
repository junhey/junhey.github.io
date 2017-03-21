title: centos搭建git过程
categories: linux
tags: [linux,centos,git]
date: 2017-3-20 22:18:00
---
### 确认服务器是否安装Git
```
rpm -qa git
```
### 首先需要安装Git，可以使用yum源在线安装
```
yum install -y git
```

### 创建用户junhey-git
```
useradd junhey-git
passwd junhey-git

```

### 生成ssh公钥
```
su junhey-git
cd ~
mkdir .ssh
ssh-keygen -t rsa
cd .ssh/
cat id_rsa.pub >> ~/.ssh/authorized_keys
exit
```
### 添加junhey-git到sudoers文件
junhey-git用户现在对一些文件夹没有操作权限，修改/etc/sudoers文件来改变他的权限。最高管理员用户用下面命令打开。
```
visudo
```
然后我们在vim中找到下面这行
root ALL=(ALL) ALL
按i键开始插入，回车一下在下面一行加上
junhey-git ALL=(ALL) ALL
接着按下esc键，输入 :wq ，回车保存退出

### 创建Git代码仓库
```
mkdir gitrepo
cd gitrepo
mkdir test.git
chown -R junhey-git:junhey-git gitrepo/
git init --bare test.git
```
>git clone ssh://username@username.webfactional.com:/home/username/webapps/git_app/repos/dev.git

### 本地拉取代码/克隆仓库
```
mkdir test
git init
git remote add origin junhey-git@139.129.130.226:/gitrepo/test.git
//或者
git clone junhey-git@139.129.130.226:/gitrepo/test.git
```