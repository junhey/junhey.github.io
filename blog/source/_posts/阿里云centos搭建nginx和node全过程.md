---
title: 阿里云centos搭建nginx和node全过程
date: 2017-02-26 16:59:09
tags: [nginx,node,php,centos]
---

*centos版本:CentOS release 6.8 (Final)*


1. ssh登录
```    
ssh root@139.129.130.226 
```
然后输入密码

2. yum更新
```
yum -y update
```

3. 编译源代码的开发工具
```
yum -y groupinstall "Development Tools"
```

## 安装node.js

```
#进入/usr/src文件夹，这个文件夹通常用来存放软件源代码
cd /usr/src

#从Node.js的站点中获取压缩档源代码, 我选择的版本为v0.10.18
wget http://nodejs.org/dist/v0.10.18/node-v0.10.18.tar.gz

#解压缩源文件，并且进入到压缩后的文件夹中
tar zxf node-v0.10.18.tar.gz 
cd node-v0.10.18 

#执行配置脚本来进行编译预处理
./configure
make&make install

#测试安装Node.js的模块管理器npm
npm -g install express

#建立超级链接, 不然 sudo node 时会报 "command not found"
sudo ln -s /usr/local/bin/node /usr/bin/node 
sudo ln -s /usr/local/lib/node /usr/lib/node 
sudo ln -s /usr/local/bin/npm /usr/bin/npm

```

## 安装 Nginx

```
#安装一些额外的软件仓库
sudo yum install epel-release -y
rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm

#包管理工具安装nginx
sudo yum install nginx -y

#启动
service nginx start
```
通过公网ip (本地可以通过 localhost /或 127.0.0.1 ) 查看nginx 服务返回的信息:
*Welcome to nginx!*

其中启动过程报错：
```
Starting nginx: nginx: [emerg] socket() [::]:80 failed (97: Address family not supported by protocol)
                                                           [FAILED]
```
解决办法：
```
vim /etc/nginx/conf.d/default.conf
```
将
```
listen       80 default_server;
listen       [::]:80 default_server;
```
改为：
```
listen       80;
#listen       [::]:80 default_server;
```
重新启动nginx即可 试过kill nginx 进程，修改关闭ipv6都不管用

## 安装mongodb
安装说明：
- 系统环境：Centos-6.8
- 安装软件：mongodb-linux-x86_64-2.4.9.tgz
- 下载地址：http://fastdl.mongodb.org/linux/mongodb-linux-x86_64-2.4.9.tgz
- 上传位置：/usr/local/
- 软件安装位置：/usr/local/mongodb
- 数据存放位置：/var/mongodb/data - 日志存放位置：/var/mongodb/logs

```
#进入文件夹/usr/local,下载mongodb源代码
cd /usr/local
wget http://fastdl.mongodb.org/linux/mongodb-linux-x86_64-2.4.9.tgz

#解压安装包，重命名文件夹为mongodb
tar zxvf mongodb-linux-x86_64-2.4.9.tgz 
mv mongodb-linux-x86_64-2.4.9 mongodb

#在var文件夹里建立mongodb文件夹，并分别建立文件夹data用于存放数据，logs用于存放日志
mkdir /var/mongodb
mkdir /var/mongodb/data
mkdir /var/mongodb/logs

#打开rc.local文件，添加CentOS开机启动项
vim /etc/rc.d/rc.local

#将mongodb启动命令追加到本文件中，让mongodb开机自启动
/usr/local/mongodb/bin/mongod --dbpath=/var/mongodb/data --logpath /var/mongodb/logs/log.log -fork

#启动mongodb
/usr/local/mongodb/bin/mongod --dbpath=/var/mongodb/data --logpath /var/mongodb/logs/log.log -fork

#看到如下信息说明已经安装完成并成功启动
forked process: 18394
all output going to: /var/mongodb/logs/log.log

```