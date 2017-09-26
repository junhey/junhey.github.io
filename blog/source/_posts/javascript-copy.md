title: JS对象的深浅复制			
categories: JavaScript
tags: [javascript]
date: 2018-9-26 21:18:20
---

## 浅复制

关于js对象的深浅复制，先来一段代码
```javascript
//对象浅复制
function shadowCopy(obj){
    if(typeof obj !== 'object') return ;
    var newObj;
    if(obj.constructor === Array){
        newObj = [];
    } else {
        newObj = {};
        newObj.constructor = obj.constructor;//保留对象的constructor属性
    }
    for(var prop in obj){
        if(obj.hasOwnProperty(prop)){
          newObj[prop] = obj[prop];
        }
    }
    return newObj;
 }
```
上述代码实现了浅复制，其中解决了`不能正确实现数组的浅复制`和`复制操作丢失了对象的constructor属性`的问题，那么什么是深浅复制呢？
从层次上对象的复制分为浅复制和深复制，浅复制是指只复制一层对象的属性，不会复制对象中的对象的属性，对象的深复制会复制对象中层层嵌套的对象的属性。复制对象时，除了要复制对象的属性外，还要兼顾到是否保留了对象的constructor属性，是否对每一种数据类型（JavaScript常见的数据类型有String,Number,Boolean,Data,RegExp,Array,Funtion,Object）都实现正确的复制。实现浅复制可以用Object.assign函数，👇下面具体讲讲这个函数。

Object.assign函数
函数参数为一个目标对象（该对象作为最终的返回值）源对象(此处可以为任意多个)。通过调用该函数可以拷贝所有可被枚举的自有属性值到目标对象中。拷贝过程中将调用源对象的getter方法，并在target对象上使用setter方法实现目标对象的拷贝。
```Object.assign(target, ...sources)```
使用该函数需要注意三点：1. 可被枚举的属性，2. 自有属性，3. string或者Symbol类型是可以被直接分配的。

## 深复制

那么深复制可能就需要层层递归，复制对象的所有属性，包括对象属性的属性的属性，有人想出了用JSON的解析实现，如下代码：
```javascript
function deepCopy(obj){
   if(typeof obj !== "object"){ return ;}
   var str = JSON.stringify(obj);
   return JSON.parse(str);
}
```
👆上面的方法不适用的条件是
1. 需要考虑把函数，正则等特殊数据类型复制
2. 当前对象不支持JSON
3. JSON复制会忽略掉值为undefined以及函数表达式
可以看下面的栗子：
```javascript
var obj = {
    a: 1,
    b: 2,
    c: undefined,
    sum: function() { return a + b; }
};
var obj2 = JSON.parse(JSON.stringify(obj));
console.log(obj2);//输出：Object {a: 1, b: 2}
```
这个时候还是要层层递归来不同情况不同分析来考虑的，最终的方案如下：
```javascript
//对象深复制
function deepCopy(obj){
    var newObj = obj.constructor === Array ? []:{};
    newObj.constructor = obj.constructor;
    if(typeof obj !== "object"){ 
        return ;
    } else if(window.JSON){
        newObj = JSON.parse(JSON.stringify(obj));//若需要考虑特殊的数据类型，如正则，函数等，需把这个else if去掉即可
    } else {
        for(var prop in obj){
            if(obj[prop].constructor === RegExp ||obj[prop].constructor === Date){
                newObj[prop] = obj[prop];
            } else if(typeof obj[prop] === 'object'){
                newObj[prop] = deepCopy(obj[prop]);//递归
            } else {
                newObj[prop] = obj[prop];
            }
        }
    } 
    return newObj;
}
```

## 第三方库实现的深浅复制（推荐看文档源码，这里就不详讲了）


1. jQuery.extend

[jQuery.extend()](http://api.jquery.com/jQuery.extend/)

2. lodash 中  _.clone() / _.cloneDeep()

[_.clone()](https://lodash.com/docs#clone)
[_.cloneDeep()](https://lodash.com/docs#cloneDeep)

## 总结
在我们平时应用过程中，浅复制优先考虑Object.assign函数，深复制优先考虑lodash中的_.cloneDeep()方法，如果是简单的深复制并符合JSON格式可以考虑JSON.parse(JSON.stringify(obj))。


参考：
[js 基础深浅拷贝](https://zhuanlan.zhihu.com/p/26282765)
[理解Object.assign](https://cnodejs.org/topic/56c49662db16d3343df34b13)
[js深浅复制](https://segmentfault.com/a/1190000005898146)