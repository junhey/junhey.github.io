---
title: hexo
date: 2017-01-26 15:18:57
tags:hexo
---

本文主要是在部署部分的坑和利用travis-ci持续集成部署的方式

# 配置github

[配置SSH](https://help.github.com/articles/connecting-to-github-with-ssh/)

# 安装[node](https://nodejs.org/en/)


# 安装[git](https://git-scm.com/)


# 安装[hexo](https://hexo.io/)

```
npm install hexo-cli -g
hexo init blog
cd blog
npm install
hexo server
```

# 部署

创建Github Repository：Repository名字是你的Github名.github.io ，比如我的junhey.github.io
其实还可以创建一个gh-pages分支来展示博客

打开博客根目录下的_config.yml文件，末尾添加如下信息。
```
deploy:
  type: git
  repository: 上一步的Github仓库地址，项目主页点SSH再复制URL
  branch: master或gh-pages
```
然后执行生成和发布的命令即可。
```
hexo generate # 生成静态页面，可以简化为hexo g
hexo deploy # 部署到Github，可以简化为hexo d
```
以上是正常部署，这样的话离开的电脑环境很难发布文章。
目前来说我看到的有两种自动化部署的方式：
	- git的webhook (需要公网服务器，具体怎么用可以百度)
	- travis-ci (持续集成，github自动同步代码)

以下是博客利用travis-ci自动化生成的代码
[https://github.com/junhey/junhey.github.io/blob/develop/.travis.yml](https://github.com/junhey/junhey.github.io/blob/develop/.travis.yml)
相信你能够看懂原理。
其中的配置看文档吧。
[https://docs.travis-ci.com/user/getting-started/](https://docs.travis-ci.com/user/getting-started/)

#  坑

1. 发布github需要先```$ npm install hexo-deployer-git --save```

2. 新版hexo配置type属性要写git，很多博客教程写的是github都是老版本遗留问题

3. 推送github可以用ssh推送，不行用https
