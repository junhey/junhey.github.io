title:  学习设计模式之MVC、MVP、MVVM
categories: javascript
tags: [javascript,function]
date: 2017-08-19 21:26:50
---

>引言：认真学习了下广义MVC模式下前端怎么写，狭义的MVC其实是有一个变化过程：MVC MVP MVVM，网上看了很多的关于这方面的介绍，以前总是将视图数据逻辑写一个模块，最近尝试分开并用组件式的开发的方式...

### **MVC**
MVC是模型(Model)－视图(View)－控制器(Controller)的缩写，是设计模式中最常用的软件架构。
>视图（View）：用户界面。
控制器（Controller）：业务逻辑
模型（Model）：数据保存

所有方式都是单向通信：
- View 接受用户交互请求
- View 将请求转交给Controller处理
- Controller 操作Model进行数据更新保存
- 数据更新保存之后，Model会通知View更新
- View 更新变化数据使用户得到反馈

MVC简化模型
```javascript
//页面加载后创建MVC对象
$(function(){
    //创建MVC对象
    var MVC=MVC||{}；
    //初始化MVC数据模型层
    MVC.model=function(){}();
    //初始化MVC视图层
    MVC.view=function(){}();
    //初始化MVC控制器层
    MVC.controller=function(){}();
});
```
1. MVC数据模型层
```javascript
//MVC数据模型层
MVC.model=function(){
	//内部数据对象
    var M={};
    //服务器端获取数据，通常通过Ajax获取并存储
    M.data={};
    //配置数据
    M.config={};
    return {
    	//获取服务器端数据
    	getData:function(m){
    		return M.data[m];
    	},
    	//获取配置数据
    	getConfig:function(c){
    		//根据数据字段获取数据
    		return M.config[c]
    	},
    	//设置服务器数据
    	setData:function(m,v){
    		M.data[m]=v;
    		return this;
    	},
    	//设置配置数据
    	setConfig:function(c,v){
    		M.data[c]=v;
    		return this;
    	}
    };
}();

```
2. MVC视图层
```javascript
//MVC视图层
MVC.view=function(){
	//模型数据层对象操作方法引用
	var M=MVC.model;
	//内部视图创建方法对象
	var V={};
	//获取视图的接口方法
	return function(v){
		//根据视图名词返回视图
		V[v]();
	}
}();
```

3. MVC控制器层
```javascript
//MVC控制器层
MVC.controller=function(){
	//模型数据层对象操作方法引用
	var M=MVC.model;
	//视图数据层对象操作方法引用
	var V=MVC.view;
	//控制器创建方法对象
	var C={};
}();
```


### **MVP**
MVP是Model-View-Presenter，即将MVC中的控制器Controller换成了Presenter负责逻辑的处理。
>MVC和MVP的区别是：在MVP中View并不直接使用Model，它们之间的通信是通过Presenter (MVC中的Controller)来进行的，所有的交互都发生在Presenter内部，而在MVC中View会直接从Model中读取数据而不是通过 Controller。

各部分之间都是双向通信：
- View 接收用户交互请求
- View 将请求转交给 Presenter
- Presenter 操作Model进行数据更新
- Model 通知Presenter数据发生变化
- Presenter 更新View数据

### **MVVM**
MVVM是Model-View-ViewModel，和MVP的区别在于Presenter换成了ViewModel负责逻辑处理。
>MVVM的优点是低耦合、可重用性、独立开发。

双向绑定（data-binding）：
- View 接收用户交互请求
- View 将请求转交给ViewModel
- ViewModel 操作Model数据更新
- Model 更新完数据，通知ViewModel数据发生变化
- ViewModel 更新View数据

后面会详细介绍MVVM的设计模式架构，同时会有针对于react和vue之类MVVM框架的原理。

参考文章：
1. [MVC，MVP 和 MVVM 的图示](http://www.ruanyifeng.com/blog/2015/02/mvcmvp_mvvm.html)
2. [mvc、mvp、mvvm使用关系总结](http://blog.csdn.net/hudan2714/article/details/50990359)
