title:  javascript 函数
categories: javascript
tags: [javascript,function]
date: 2017-03-17 12:36:56
---

### 函数创建方式

- 声明

```
function consoleTip (){
    console.log("tip!"); 
}
```
- 表达式

```
var consoleTip = function(){ 
    console.log("tip!"); 
}
```
- 两种方式异同

1. 表达式方式适合用来定义只使用一次的函数，声明方式定义的函数没有这个限制，当然也不是绝对的，这个区别只适用于编码规范上；

2. 声明方式定义的函数可以在函数调用之前定义也可以在函数调用之后定义，而表达式方式定义的函数只能在函数调用之前定义；



### 函数参数

函数参数包括形参，实参，形参就是函数定义时的参数；实参就是函数调用时传入的参数。由于js是弱类型语言，所以js函数的形参不指定类型。

js函数的形参和实参个数可以不一致。形参个数小于实参时，未传的形参值都是undefined,注意形参可以指定默认值，但是只能在函数体内部指定;形参个数小于实参时，在函数体内引用多余实参，必须通过实参对象arguments来获取实参，在函数体内部arguments就是实参对象的引用，并且此时的实参对象是一个数组对象，数组对象每一项对应着函数调用时传入的参数。

PS：实参对象有两个特殊属性callee和caller，其中callee属性代指当前正在执行的函数，caller属性代指调用当前正在执行的函数的函数，caller属性不是标准属性，不是所有浏览器都支持。使用callee属性的典型例子就是匿名函数的递归调用。例如定义一个阶乘函数：
```
var fact = function(x){ 
    if(x <= 1) {
        return 1;
    }else{
        return arguments.callee(x-1)*x;
    }
};
```


### 函数作用域

在函数中声明的变量(包括函数形参)在整个函数体内都是可见的，包括嵌套的函数中，在函数外部是不可见的;函数体内部定义的变量会覆盖同名的全局变量;

函数作用域中有个特性很重要，就是*声明提前*，意思就是在函数内部任意位置声明的变量，在函数体内部任意位置都是可见的，这是因为js引擎在预编译js时会把函数中所有的变量声明都提前至函数体顶部。例如：
```
var scope = "outter";
function(){
    console.log(scope);  //undefined
    var scope = "inner";
    console.log(scope); //inner
}();
console.log(scope);     //outter
```
说明：
　　undefined　由于函数作用域的声明提前特性，这里的scope已经在函数顶部声明，但是没有被赋值，所以scope值为undefined
　　inner　scope在函数体内部声明，并且有赋值
　　outter 　函数体内部定义的变量会覆盖同名的全局变量，但是不影响全局变量的值

### 构造函数

构造函数的用处就是用来初始化新创建的对象，例子：`var ary = new Array();

构造函数与普通函数的区别：
　1.函数命名上有区别，构造函数命名时通常是首字符大写，普通函数命名时首字符小写；
　2.调用方式的区别，构造函数是通过new关键字调用，而普通函数直接调用。


### 立即执行函数

把函数定义和函数执行结合到一起就是立即执行函数，也叫自执行函数。

这里需要注意两点：
1. 函数定义仅限于表达式方式定义的函数；
2. 函数执行实际上就是对函数表达式做一次运算，所以一元运算符都可以让函数执行。

这样的话，立即执行函数就会有多种写法：
```
(function(){console.log("IIFE");}());
(function(){console.log("IIFE");})();
!function(){console.log("IIFE");}();
void function(){console.log("IIFE");}();
~function(){console.log("IIFE");}();
//....
```
立即执行函数可以接受参数，上面的写法都是可以的，但是编码规范推荐第一种写法，jQuery库使用的就是第一种写法。

那么自执行函数的用处有哪些呢？总结起来常用也就两种：
1. 保存参数上下文环境；
2. 作为命名空间。

用处1的适用场景：循环中执行异步函数，并且函数参数随循环变化。

```
/**
* 实例一
* 错误写法,因为jQuery的post方法是异步的，循环十次，post方法并行跑十次，
* 循环比post方法执行要快，最终传过去的i值都变成了10,即服务端收到index的都是10
*/
for(var i=0; i<10; i++){
    $.post(url,{index:i},function(){});
}
/**
* 正确写法,这样对于循环体中的立即执行函数来说，每次循环得到的参数都不同。立即执行函数
* 每执行一次都会创建一个函数上下文环境，在这个上下文环境中的变量值不受外界影响，
* 循环十次就会创建十个上下文环境，并且每个上下文环境的i值都不一样。这样的话，
* 虽然post方法是异步方法，但是是在每一个上下文环境中执行的，也就是说循环十次，
* post方法在十个上下文环境中分别执行了一次，post方法中使用的index参数每次都不一样，
* 最终服务端收到的index值就是从0到9十个数值
*/
for(var i=0; i<10; i++){
    (function(index){$.post(url,{index:index},function(){});}(i));
}

/**
* 实例二    
* 错误写法，最终会输出十个10，因为循环体的语句会延时执行
*/
for(var i=0; i<10; i++){
    setTimeout(function(){console.log(i);},100);
}

//正确写法，最终会输出0到9十个数值，原理同上
for(var i=0; i<10; i++){
    (function(x){setTimeout(function(){console.log(x);},100);}(i));
}
```

用处2的适用场景：你需要写一个公共模块，这个公共模块在很多地方都会使用，但是要保证公共模块中使用的变量和函数不会对其它模块造成污染，这样的话这个公共模块就需要一个单独的不同于其它模块的命名空间。

案例1：创建jQuery插件，保证创建的jQuery插件在jQuery的命名空间内都是有效的，这样每个jQuery对象才可以使用。

```
(function($){
    $.fn.changeStyle = function(colorStr){
        this.css("color",colorStr);        
        return this;
    }
}(jQuery));
```
[jQuery插件开发](http://www.jianshu.com/p/518d424d4994)

案例2：创建一个带有私有变量和私有方法的对象。
```
var obj = (function(){
    var privateAttr,
        publicAttr;        
    function _setPriAttr(){
        privateAttr = "private";
    }        
    function getPriAttr(){
        return privateAttr;
    }        
    return {
        attr:publicAttr,            
        getAttr:function(){
            getPriAttr();
        }
    }
}());
```
通过这种方式创建的对象，利用立即执行函数的return语句对外暴露属性以及方法，并且可以保证没有对外暴露对象的属性和方法，在对象外边是无法访问到的。

总结：其实用处1和用处2的原理都是一样的，都是利用了函数作用域的概念，请仔细体会。

参考资料： [js权威指南](https://item.jd.com/10974436.html)
