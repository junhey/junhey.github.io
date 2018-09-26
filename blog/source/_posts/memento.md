title: 设计模式-备忘录模式
categories: design-patterns
tags: [design-patterns]
date: 2018-09-26 22:58:09
---
备忘录模式（Memento）
在不破坏对象的封装性的前提下，在对象之外捕获并保存该对象内部的状态以便日后对象使用或者对象恢复到以前的状态。

比如我们分页数据切换时，上一页下一页数据切换，点击下一页的时候缓存好上一页已经加载的数据。

eg：
```javascript
const Page = function()={
  let cache = {} //缓存
  return function(page, fn){
    if(cache[page]){// 判断缓存是否有数据
      // 从缓存中读取数据
      showPage(page, cache[page]);
      fn&& fn();
    }else{
      // 发请求获取数据
      $.get();
    }
  }
}

```

备忘者模式最主要的任务是对现有的数据或者状态做缓存，为将来某个时刻使用或者恢复做准备。
