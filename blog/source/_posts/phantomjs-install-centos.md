title:  phantomjs安装在centos和入门教程			
categories: javascript
tags: [javascript,phantomjs]
date: 2017-03-01 11:36:00
---

### 官方网站

[http://phantomjs.org/](http://phantomjs.org/)

[下载与安装](http://phantomjs.org/download.html)

### 安装步骤

```
#安装依赖软件
yum -y install wget fontconfig


#下载安装包
wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2

#解压安装包
tar xjf phantomjs-2.1.1-linux-x86_64.tar.bz2 -C /usr/local/


#重命名
mv /usr/local/phantomjs-2.1.1-linux-x86_64 /usr/local/phantomjs

#添加环境变量/建立软链接
export PHANTOMJS_HOME=/usr/local/phantomjs/bin
ln -s /usr/local/phantomjs/bin/phantomjs /usr/bin/

#测试
phantomjs --version

```

### 入门

[官方文档](http://phantomjs.org/documentation/)

[PhantomJS教程](http://javascript.ruanyifeng.com/tool/phantomjs.html)