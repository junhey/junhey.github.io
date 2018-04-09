title:  微信小程序-移动端商城	
categories: javascript
tags: [javascript,wxapp]
date: 2017-07-06 11:46:09
---
# 微信小程序-移动端商城

---

### 安装

- git 复制和拉取分支

```
git clone ssh://git@gitlab.modernavenue.com:10022/fe/wx-app.git
cd wx-app
git checkout -b canudilo-product
git pull origin canudilo-product
git checkout product
git checkout -b 01men-product
git pull origin 01men-product
git checkout --orphan release
git reset --hard
git pull origin release
git checkout -b canudilo-release
git pull origin canudilo-release
git checkout release
git checkout -b 01men-release
git pull origin 01men-release
```

- 添加 git 钩子  
新建文件 wx-app/.git/hooks/pre-push，文件内容为

```
#!/bin/sh
while read local_ref local_sha remote_ref remote_sha
do
    branch=$(git rev-parse --symbolic --abbrev-ref $local_ref)
    if [ "release" == "$branch" ]; then
        git checkout canudilo-release
        git pull -r origin canudilo-release
        git rebase release
        git push -f origin canudilo-release
        git checkout 01men-release
        git pull -r origin 01men-release
        git rebase release
        git push -f origin 01men-release
    fi
    if [ "product" == "$branch" ]; then
        git checkout canudilo-product
        git pull -r origin canudilo-product
        git rebase product
        git push -f origin canudilo-product
        git checkout 01men-product
        git pull -r origin 01men-product
        git rebase product
        git push -f origin 01men-product
    fi
done
exit 0
```

- 安装 npm 模块
```
cd wx-app
npm install
npm install gulp -g
```

- 安装微信开发者工具


> [微信开发者工具](https://mp.weixin.qq.com/debug/wxadoc/dev/devtools/download.html)


> [开发文档](https://mp.weixin.qq.com/debug/wxadoc/dev/index.html)


- 导入项目代码

> 注：需要有开发者权限，'小程序ID'

1. 卡奴AppID(小程序ID) wx31674f508491c876

2. 01men AppID(小程序ID) wx6e71dc39094db668

项目目录选择 wx-app\src (dist目录为发布时用)


```
//测试微信号
modernavenuetest
123456test(原密码18565538230test)
```



### 目录结构

- app.js — 对本页面的窗口表现进行配置。
- app.json — 对微信小程序进行全局配置，决定页面文件的路径、窗口表现、设置网络超时时间、设置多 tab 等。
- app.wxss — 接受一个数组，每一项都是字符串，来指定小程序由哪些页面组成。

- images — 存放项目图片
- pages — 存放项目页面相关文件
- pages/common — 存放独立wxss样式文件和template,可import引入
- utils — 存放utils文件，可require引入  
- configs — 配置文件 api 等配置
- components — 模块组件 

### 开发步骤和细节

- 图片资源

有关微信小程序的前台资源，已放在  cache1 上的 
    /home/modern/datas/wxapp
目录下，以后这类的全在这里 ( 相关的 nginx 都已改好 )

默认对应的测试/正式访问的 url 如下：
https://testimage.modernavenue.com/wxapp/01men/activity/home-c1.jpg
http://staticm.modernavenue.com/wxapp/01men/activity/home-c1.jpg
如果后续产品那提出来，微信小程序的要修改相关显示资源图片，上传与下载的目录对应在这里
    /home/modern/datas/wxapp/(小程序名，如：01men、canudilo)/... 

- 页面生命周期

1. 小程序注册完成后，加载页面，触发onLoad方法。
2. 页面载入后触发onShow方法，显示页面。
3. 首次显示页面，会触发onReady方法，渲染页面元素和样式，一个页面只会调用一次。
4. 当小程序后台运行或跳转到其他页面时，触发onHide方法。
5. 当小程序有后台进入到前台运行或重新进入页面时，触发onShow方法。
6. 当使用重定向方法wx.redirectTo(OBJECT)或关闭当前页返回上一页wx.navigateBack()，触发onUnload

常规页面A：onLoad()-->onShow()-->onReady()-->onHide()-->onUnload()
释义：
onLoad()：监听页面加载，一个页面只会调用一次
onShow()：监听页面显示，每次打开页面都会调用一次
onReady()：监听页面初次渲染完成，一个页面只会调用一次，代表页面加载完毕，视图层和逻辑层可进行交互
onHide()：监听页面隐藏，当页面被覆盖或进入后台执行
onUnload()：监听页面卸载，当页面被关闭或内存不足主动销毁页面

wx.navigateTo跳转状态下，页面A和页面B的生命周期逻辑
进入A页面：A执行onLoad()-->onShow()-->onReady()；
A页面navigateTo B页面：A执行onHide()，B执行onLoad()-->onShow()-->onReady()；
B页面返回A页面：B执行onUnload()，A执行onReady()；
退出A页面：A执行onUnload()。
```
Page({
  data:{},
  onLoad:function(options){
    // 页面初始化 options为页面跳转所带来的参数
  },
  onReady:function(){
    // 页面渲染完成
  },
  onShow:function(){
    // 页面显示
  },
  onHide:function(){
    // 页面隐藏
  },
  onUnload:function(){
    // 页面关闭
  }
})
```


- 异步获取数据

```
var _this = this;
var param = fetch.requestBase();
param.orderId = e.currentTarget.dataset.id;
var url=config.host+config.orderDelet;
fetch.fetch('GET',url,param,(err,res)=>{
    if (res.ecode === '0000') {
        console.log(res.data);
    }else{
        fetch.defaultErrorDeal(url,'请求错误');
    }
});

```

### 版本控制流程

- 分支

release 预发布测试分支  
product 发布主分支

- 开发

```
git checkout product  
git checkout -b BRANCH
git add .
git commit -m 'COMMENT'
```

BRANCH 分支按照develop- feature- fixbug-  release- 来命名 简写dev-  fea-  fix-  rel-

COMMENT 主要写功能点 bug 等

- 测试

```
git checkout release
git pull origin release
git merge --no-ff BRANCH
git push origin release
```

- 发布

```
git push origin BRANCH  
https://gitlab.modernavenue.com/  
Merge Requests --> New Merge Requests --> Select source branch (BRANCH) --> Compare branches and continue  
选择 Assignee, 勾选 Remove source branch when merge request is accepted. --> Save Changes  
如果有冲突，需要进行以下操作  
git checkout product  
git pull origin product  
git checkout BRANCH  
git merge --no-ff product  
git push origin BRANCH  
```


### 不同小程序

- 分支  
canudilo-product 卡奴发布分支  
01men-product 01men发布分支  
canudilo-release 卡奴测试分支  
01men-release 01men测试分支  

更新以上分支需要增加-r 参数（rebase）  
>git pull -r origin BRANCH  


- 配置区别  
app.json 首页进入不同修改，标题修改  
configs/config.js 请求接口平台参数不同修改  