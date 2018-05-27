title:  Js继承的实现
categories: javascript
tags: [javascript,class]
date: 2018-05-27 15:26:50
---

被问到es6的class继承是怎么实现的，想了一会不知道怎么回答好，然后感觉里面会有一些优化之类的，便想了写写代码试试

```html

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>继承</title>
</head>

<body>
  <script>
  /**
   * [使用对象冒充实现继承（多继承）]
   */
  function Parent(name) {
    this.name = name
    this.sayName = function() {
      console.log(this.name)
    }
  }
  var iParent = new Parent('james')
  iParent.sayName()

  function Child(name) {
    this.parent = Parent
    this.parent(name)
    delete this.parent
    this.saySome = function() {
      console.log('my name: ' + this.name)
      this.sayName()
    }
  }

  var iChild = new Child('kobe')
  iChild.saySome()
  console.log(iChild.constructor)

  /** 
   * Call/Apply方法改变函数上下文实现继承（该种方式不能继承原型链，若想继承原型链，则采用混合模式）
   * 实现原理：改变函数内部的函数上下文this，使它指向传入函数的具体对象
   */
  function Parent(firstname) {
    this.fname = firstname;
    this.age = 28;
    this.sayAge = function() {
      console.log(this.age);
    }
  }

  function Child(firstname) {
    Parent.call(this, firstname); // 将this传给父构造函数
    //Parent.apply(this, [firstname]); // 与call作用相同
    this.saySomeThing = function() {
      console.log(this.fname);
      this.sayAge();
    }
    this.getName = function() {
      return firstname;
    }
  }
  var myChild = new Child('Lee');
  myChild.saySomeThing();
  console.log(myChild.constructor)
  myChild.constructor == Child; // true

  /**
   * 原型链实现继承
   * 实现原理：使子类原型对象指向父类的实例以实现继承，即重写类的原型，弊端是不能直接实现多继承
   */
  function Parent() {
    this.sayAge = function() {
      console.log(this.age);
    }
  }

  function Child(firstname) {
    this.fname = firstname;
    this.age = 28;
    this.saySomeThing = function() {
      console.log(this.fname);
      this.sayAge();
    }
  }
  Child.prototype = new Parent();
  var myChild = new Child('Lee');
  myChild.saySomeThing(); // Lee 28

  /**
   * 混合模式
   */
  function Parent() {
    this.sayAge = function() {
      console.log(this.age);
    }
  }
  Parent.prototype.sayParent = function() {
    alert('This is parent!');
  }

  function Child(firstname) {
    Parent.call(this);
    this.fname = firstname;
    this.age = 28;
    this.saySomeThing = function() {
      console.log(this.fname);
      this.sayAge();
    }
  }
  Child.prototype = new Parent();
  var myChild = new Child('Lee');
  myChild.saySomeThing();
  myChild.sayParent();
  console.log(myChild.constructor)

  function Parent(hello) {
    this.hello = hello;
  }
  Parent.prototype.sayHello = function() {
    alert(this.hello);
  }

  function Child(hello, world) {
    Parent.call(this, hello); //将父类的属性继承过来 
    this.world = world; //新增一些属性 
  }
  Child.prototype = new Parent(); //将父类的方法继承过来 
  Child.prototype.sayWorld = function() { //新增一些方法 
    alert(this.world);
  }
  var c = new Child("zhangsan", "lisi");
  c.sayHello();
  c.sayWorld();

  /**
   * es6继承
   */
  class Animal {
    //构造函数
    constructor(props) {
      this.name = props.name || '未知';
    }

    eat() {
      alert(this.name + "在吃东西...");
    }
  }

  //class继承
  class Bird extends Animal {
    //构造函数
    constructor(props) {
      //调用实现父类的构造函数
      super(props);
      this.type = props.type || "未知";
    }

    fly() {
      alert(this.name + "在飞...");
    }
  }
  var myBird = new Bird({
    name: '鹦鹉'
  })
  myBird.eat()
  myBird.fly()
  </script>
</body>

</html>

```
以上代码是实现js继承的一些方法，仅供参考。