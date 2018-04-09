title:  React生命周期
categories: javascript
tags: [javascript,reactjs]
date: 2017-10-11 22:32:10
---

>在我们编程过程中对于React学习最重要的就是生命周期了，学习react生命周期对于自己的编程也会有很大的帮助。

如果你基础够好的话建议直接看代码[https://github.com/facebook/react/blob/master/src/renderers/dom/__tests__/ReactDOMProduction-test.js#L89-L175](https://github.com/facebook/react/blob/master/src/renderers/dom/__tests__/ReactDOMProduction-test.js#L89-L175)，从代码中可以看出ReactDOM的生成过程，下面详讲React的生命周期：

1. 实例化

- getDefaultProps
调用 React.createClass，然后触发getDefaultProps 方法，该方法返回一个对象，然后与父组件指定的props对象合并，最后赋值给 this.props 作为该组件的默认属性，该方法只调用一次

- getInitialState
初始化state 的值，返回值会赋给this.state，在这个方法里，你已经可以访问到this.props。

- componentWillMount
操作state，不会触发再次渲染，建议用constructor代替

- render
根据 state 的值，生成页面需要的虚拟 DOM 结构

- componentDidMount
可以设置state，会触发再次渲染，组件内部可以通过 ReactDOM.findDOMNode(this)来获取当前组件的节点操作DOM


2. 存在期

- componentWillReceiveProps(nextProps)
当组件接收到新的props时会触发该函数，通常可以调用this.setState方法来比较this.props和nextProps的执行状态，完成对state的修改

- shouldComponentUpdate(nextProps, nextState
该方法用来拦截新的props或state，然后判断是否更新组件

- componentWillUpdate(nextProps, nextState)
更新之前调用

- rende
根据diff算法，生成需要更新的虚拟DOM数据

- componentDidUpdate(prevProps, prevState)
render方法成功执行之后，会渲染出来真实的DOM，你可以在该方法中使用this.getDOMNode()方法访问原生DOM

3. 销毁&清理期

- componentWillUnmount
会触发componentWillUnmount，通常是移除DOM，取消事件绑定，销毁定时器等工作

---
参考文献：
[理解React 组件](https://segmentfault.com/a/1190000006917448)
[React组件的生命周期](http://www.cnblogs.com/webbest/p/5862436.html)
[React生命周期解析](http://www.jianshu.com/p/c36a0601b00c)