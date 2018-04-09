title:  javascript event loop
categories: javascript
tags: [javascript,event-loop]
date: 2017-03-17 12:36:56
---

在Nodejs事件循环机制中，有任务两个队列
1. Macrotask队列
2. Microtask队列

在一个事件循环里，这两个队列会分两步执行，第一步会固定地执行一个（且仅一个）Macrotask任务，第二步会执行整个Microtask队列中的所有任务。并且，在执行Microtask队列任务的时候，也允许加入新的Microtask任务，直到所有Microtask任务全部执行完毕，才会结束循环。  

>简单点讲就是：先执行Macrotask任务, 然后检查Microtask队列 , 如果有就执行Microtask队列 , 再回到Macrotask任务中

任务队列不止一个, 且存在优先级:  
process.nextTick > promise.then > setTimeout > setImmediate

- macrotasks: script(整体代码),setTimeout, setInterval, setImmediate, I/O, UI rendering

- microtasks: process.nextTick, Promises, Object.observe, MutationObserver


whatwg规范: 
- 一个事件循环(event loop)会有一个或多个任务队列(task queue) 
- task queue 就是 macrotask queue 
- 每一个 event loop 都有一个 microtask queue 
- task queue == macrotask queue != microtask queue 
- 一个任务 task 可以放入 macrotask queue 也可以放入 microtask queue 中

包裹在一个 script 标签中的js代码也是一个 task 确切说是 macrotask.

例如从一个事件循环开始，到结束会经历以下步骤： 
1. 引擎从macrotask queue中取出一个任务执行; 
2. 将microtask queue中的所有任务取出，按顺序全部执行; 
3. 重复1;

但是, requestAnimationFrame callback 的执行时机与浏览器的 render 策略有关，是黑箱的。



看下面几个示例
```javascript
setTimeout(() => console.info(1))
new Promise((resolve, reject) => {
  console.info(2)
  setTimeout(() => {
    console.info(3)
    resolve()
    console.info(4)
  }, 0)
  console.info(5)
}).then(() => console.log(6))
console.log(7)
/**
 * Output: 2571346
 */
setTimeout(() => console.info(1))
new Promise((resolve, reject) => {
  console.info(2)
  resolve()
  setTimeout(() => {
    console.info(3)
    console.info(4)
  }, 0)
  console.info(5)
}).then(() => console.log(6))
console.log(7)
/**
 * Output: 2576134
 */
setImmediate(function(){
    console.log(1);
},0);
setTimeout(function(){
    console.log(2);
},0);
new Promise(function(resolve){
    console.log(3);
    resolve();
    console.log(4);
}).then(function(){
    console.log(5);
});
console.log(6);
process.nextTick(function(){
    console.log(7);
});
console.log(8);
/**
 * Output: 34687521
 */
async function async1() {
    console.log("a");
    await  async2(); //执行这一句后，await会让出当前线程，将后面的代码加到任务队列中，然后继续执行函数后面的同步代码
    console.log("b");
}
async function async2() {
   console.log( 'c');
}
console.log("d");
setTimeout(function () {
    console.log("e");
},0);
async1();
new Promise(function (resolve) {
    console.log("f");
    resolve();
}).then(function () {
    console.log("g");
});
console.log('h');
/**
 * Output: d a c f h b g e
 */
```


如何选用Macrotask或Microtask呢？  
可以这样简单理解：如果你想让一个任务立即执行，那么就把它设置为Microtask，除此之外都用Macrotask比较好。因为可以看出，虽然Node是异步非阻塞的，但在一个事件循环中，Microtask的执行方式基本上就是用同步的。

可能存在的问题  
相信读到这里你已经意识到，如果一个Microtask队列太长，或者执行过程中不断加入新的Microtask任务，会导致下一个Macrotask任务很久都执行不了。结果就是，你可能会遇到UI一直刷新不了，或者I/O任务一直完成不了。

应该是考虑到了这一点，至少Microtask任务中的process.nextTick任务，是被设置了（在一个事件循环中的）最大调用次数的，叫process.maxTickDepth。默认是1000。一定程度上避免了上述情况。

参考文章  
[node-js-at-scale-understanding-node-js-event-loop](https://blog.risingstack.com/node-js-at-scale-understanding-node-js-event-loop/)  
[理解 Node.js 事件循环](https://www.zcfy.cc/article/node-js-at-scale-understanding-the-node-js-event-loop-risingstack-1652.html)  
[difference-between-microtask-and-macrotask-within-an-event-loop-context](https://stackoverflow.com/questions/25915634/difference-between-microtask-and-macrotask-within-an-event-loop-context)

