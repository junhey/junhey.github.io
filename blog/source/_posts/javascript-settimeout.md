title:  JavaScript定时器原理
categories: javascript
tags: [javascript,settimeout]
date: 2017-11-20 19:02:13
---

javascript内有两个定时器setTimeout()和setInterval()。

- setTimeout
定义一个在指定时间后触发的函数或计算表达式。
```
setTimeout("alert('this is test')",2000);
```
用法可以参考下[MDN的setTimeout定义](https://developer.mozilla.org/zh-CN/docs/Web/API/Window/setTimeout)

看到后面应该是这样定义：**在指定时间内, 将任务放入事件队列,等待js引擎空闲后被执行**

- setInterval
在指定的时间间隔后执行相应的函数。
```
setInterval("console.log('demo');",1000);
```
首先看一道题：
```javascript
alert(1); 
setTimeout("alert(2)", 0); 
alert(3);
```
执行结果是1 3 2
为什么呢？答：因为js的单线程特性。
首先JS线程alert内容为1，然后读取到setTimeout定时器，这个时候就会执行浏览器的线程，然后跳过定时器继续执行，这个时候你就看到了弹出框的内容为3，然后因为定时器的时间为0，所以一执行定时器线程就会即可将弹出框内容为2字样的任务添加到主线程（JS引擎线程）的队列之后，等待JS引擎的调用，这个时候我们看到的结果是先弹出13，然后再弹出2。

这里给出一张很重要的图：
![image](https://user-images.githubusercontent.com/8244100/29369261-b35c0e50-8267-11e7-8fce-0afc1e25bb0d.png)
然而setTimeout(0)做了什么？
它会开启一个定时器线程，并不会影响后续的代码执行，这个定时器线程会在事件队列后面添加一个任务，例如上面图中的t3。等到前面的t1，t2执行完后再去执行t3，因此在前面第二部分内容中的输出顺序为1 > 3 > 2。

总结(参考文献摘来的，写得太好了😆)：
1. 浏览器的内核是多线程的，它们在内核制控下相互配合以保持同步，一个浏览器至少实现三个常驻线程：javascript引擎线程，GUI渲染线程，浏览器事件触发线程。
2. javascript引擎是基于事件驱动单线程执行的.JS引擎一直等待着任务队列中任务的到来，然后加以处理，浏览器无论什么时候都只有一个JS线程在运行JS程序。
3. 当界面需要重绘（Repaint）或由于某种操作引发回流(reflow)时,该线程就会执行。但需要注意 GUI渲染线程与JS引擎是互斥的，当JS引擎执行时GUI线程会被挂起，GUI更新会被保存在一个队列中等到JS引擎空闲时立即被执行。
4. 当一个事件被触发时该线程会把事件添加到待处理队列的队尾，等待JS引擎的处理。这些事件可来自JavaScript引擎当前执行的代码块如setTimeOut、也可来自浏览器内核的其他线程如鼠标点击、AJAX异步请求等，但由于JS的单线程关系所有这些事件都得排队等待JS引擎处理。

参考文献：
[JavaScript定时器原理及高级使用](http://blog.csdn.net/liaodehong/article/details/52212721)
[js setTimeOut() by 蒂其之死](http://www.cnblogs.com/yelongsan/p/6296700.html)
[javascript 定时器工作原理](https://segmentfault.com/a/1190000003764106)