title: JavaScript中的立即执行函数			
categories: JavaScript
tags: [javascript]
date: 2016-11-29 08:18:00
---

注：此文只在理解立即执行函数，不在所谓原创，文中大量引用[阮一峰的JavaScript标准参考教程](http://javascript.ruanyifeng.com/grammar/function.html#toc23)、[MDN的JavaScript 参考文档](http://javascript.ruanyifeng.com/grammar/function.html#toc23)和[深入理解JavaScript系列（4）：立即调用的函数表达式](http://www.cnblogs.com/tomxu/archive/2011/12/31/2289423.html)的内容。

描述
立即执行函数通常有下面两种写法：
```
(function(){ 
   ...
})();

(function(){ 
    ...
}());
```
在Javascript中，一对圆括号“()”是一种运算符，跟在函数名之后，表示调用该函数。比如，print()就表示调用print函数。
这个写法和我们想象的写法不一样（知道的人当然已经习以为常）很多人刚开始理解立即执行函数的时候，觉得应该是这样的：
```
function (){ ... }()；

//或者

function fName(){ ... }();
```
然而事实却是这样：SyntaxError: Unexpected token (。这是为什么呢？

解释
要理解立即执行函数，需要先理解一些函数的基本概念：函数声明、函数表达式,因为我们定义一个函数通常都是通过这两种方式

函数声明 (function 语句)
```
function name([param[, param[, ... param]]]) {
   statements
}
```
name：函数名；
param：被传入函数的参数的名称,一个函数最多可以有255个参数；
statements：这些语句组成了函数的函数体。

函数表达式 (function expression)

函数表达式和函数声明非常类似,它们甚至有相同的语法。
```
function [name]([param] [, param] [..., param]) {
   statements
}
```
name：函数名,可以省略,省略函数名的话,该函数就成为了匿名函数；
param：被传入函数的参数的名称,一个函数最多可以有255个参数；
statements：这些语句组成了函数的函数体。

下面我们给出一些栗子说明：
```
// 声明函数f1
function f1() {
    console.log("f1");
}
// 通过()来调用此函数
f1();


//一个匿名函数的函数表达式，被赋值给变量f2:
var f2 = function() {
    console.log("f2");
}
//通过()来调用此函数
f2();


//一个命名为f3的函数的函数表达式(这里的函数名可以随意命名，可以不必和变量f3重名)，被赋值给变量f3:
var f3 = function f3() {
    console.log("f2");
}
//通过()来调用此函数
f3();
```
上面所起的作用都差不多，但还是有一些差别
1、函数名和函数的变量存在着差别。函数名不能被改变，但函数的变量却能够被再分配。函数名只能在函数体内使用。倘若在函数体外使用函数名将会导致错误：
```
var y = function x() {};
alert(x); // throws an erro
```
2、函数声明定义的函数可以在它被声明之前使用
```
foo(); // alerts FOO!
function foo() {
   alert('FOO!');
}
```
但函数声明非常容易（经常是意外地）转换为函数表达式。当它不再是一个函数声明：

成为表达式的一部分
不再是函数或者script自身的“源元素” （source element）。在script或者函数体内“源元素”并非是内嵌的语句（statement）
```
var x = 0;               // source element
if (x == 0) {            // source element
   x = 10;               // 非source element
   function boo() {}     // 非 source element
}
function foo() {         // source element
   var y = 20;           // source element
   function bar() {}     // source element
   while (y == 10) {     // source element
      function blah() {} // 非 source element
      y++;               //非source element
   }
}
```
Examples:
```
// 函数声明
function foo() {}

// 函数表达式 
(function bar() {})

// 函数表达式
x = function hello() {}


if (x) {
   // 函数表达式
   function world() {}
}


// 函数声明
function a() {
   // 函数声明
   function b() {}
   if (0) {
      //函数表达式
      function c() {}
   }
}
```
现在我们来解释上面的SyntaxError: Unexpected token (：
产生这个错误的原因是，Javascript引擎看到function关键字之后，认为后面跟的是函数定义语句，不应该以圆括号结尾。
解决方法就是让引擎知道，圆括号前面的部分不是函数定义语句，而是一个表达式，可以对此进行运算。所以应该这样写：
```
(function(){ /* code */ }()); 

// 或者

(function(){ /* code */ })();
```
这两种写法都是以圆括号开头，引擎就会认为后面跟的是一个表示式，而不是函数定义，所以就避免了错误。这就叫做“立即调用的函数表达式”（Immediately-Invoked Function Expression），简称IIFE。

注意，上面的两种写法的结尾，都必须加上分号。
推而广之，任何让解释器以表达式来处理函数定义的方法，都能产生同样的效果，比如下面三种写法。
```
var i = function(){ return 10; }();

true && function(){ /* code */ }();

0, function(){ /* code */ }();
```
甚至像这样写：
```
!function(){ /* code */ }();

~function(){ /* code */ }();

-function(){ /* code */ }();

+function(){ /* code */ }();
```
new关键字也能达到这个效果：
```
new function(){ /* code */ }

new function(){ /* code */ }() // 只有传递参数时，才需要最后那个圆括号。
```
使用
那我们通常为什么使用函数立即表达式呢，以及我如何使用呢？

通常情况下，只对匿名函数使用这种“立即执行的函数表达式”。它的目的有两个：

一是不必为函数命名，避免了污染全局变量；
二是IIFE内部形成了一个单独的作用域，可以封装一些外部无法读取的私有变量。
```
// 写法一
var tmp = newData;
processData(tmp);
storeData(tmp);

// 写法二
(function (){
  var tmp = newData;
  processData(tmp);
  storeData(tmp);
}());
```
上面代码中，写法二比写法一更好，因为完全避免了污染全局变量。

最后在举一个真实的栗子：在JavaScript的OOP中，我们可以通过IIFE来实现一个单例(关于单例的优化不再此处讨论)

// 创建一个立即调用的匿名函数表达式
// return一个变量，其中这个变量里包含你要暴露的东西
// 返回的这个变量将赋值给counter，而不是外面声明的function自身
```
var counter = (function () {
    var i = 0;

    return {
        get: function () {
            return i;
        },
        set: function (val) {
            i = val;
        },
        increment: function () {
            return ++i;
        }
    };
} ());

// counter是一个带有多个属性的对象，上面的代码对于属性的体现其实是方法

counter.get(); // 0
counter.set(3);
counter.increment(); // 4
counter.increment(); // 5

counter.i; // undefined 因为i不是返回对象的属性
i; // 引用错误: i 没有定义（因为i只存在于闭包）
```

原文地址：[https://segmentfault.com/a/1190000003902899](https://segmentfault.com/a/1190000003902899)
文章转载，如有冒犯请联系。
