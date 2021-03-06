

目前已经实现Hmac的API鉴权，但还远达不到目标，还得实现登录后带token访问受限API的功能，受限API访问必需得先通过身份认证，UpmsAuthenticationFilter就是干这个工作的，但要实现REST，UpmsAuthenticationFilter的代码就起不了作用了，因为是否已通过身份认证是用subject.isAuthenticated()来判断的，而没有了会话状态的保持，通过SecurityUtils.getSubject().hashCode的输出就可以知道每次访问API获得的subject都是不一样的，那subject.isAuthenticated()的结果就是false，无论是否已经登录过，自然subject.getSession()获得的会话也是不一样的，连会话都不同了，那之前的访问做了什么自然也就没有办法知道了。**那么在传统web方式中，shiro是如何保证已经登录成功的用户再次访问API，SecurityUtils.getSubject()能获取得和以前一样的subject的呢？（shiro是否做到这点呢？）**

SecurityUtils.getSubject()的实现是这样的：
```
public static Subject getSubject() {
    Subject subject = ThreadContext.getSubject();
    if (subject == null) {
        subject = (new Subject.Builder()).buildSubject();
        ThreadContext.bind(subject);
    }
    return subject;
}
```
实现是依赖ThreadContext的，ThreadContext是shiro定义的一个抽象类，这个类有静态的ThreadLocal变量，ThreadContext的方法大多依赖于这个ThreadLocal变量：
```
private static final ThreadLocal<Map<Object, Object>> resources = new InheritableThreadLocalMap<Map<Object, Object>>();
```

下面就研究下ThreadLocal的作用与实现，Thread、ThreadLocal、ThreadLocalMap、ThreadLocalMap.Entry这几类是研究的重点（ThreadLocalMap是ThreadLocal的内部类，Entry又是ThreadLocalMap的内部类）。
参考：[ThreadLocal原理解析（1）：数据存取](https://blog.csdn.net/huachao1001/article/details/51970237)、[ThreadLocal原理解析（2）：ThreadLocalMap源码解析](https://blog.csdn.net/huachao1001/article/details/51734973)

ThreadLocal并不储存任何数据，真正储存数据的是ThreadLocalMap，可以先简单理解ThreadLocalMap为HashMap（实际实现是不一样，后面再说）。

ThreadLocal只定义了几个重要操作：
- set(T):void、给当前线程的专属ThreadLocalMap对象设置一个值T，对应的键为当前的ThreadLocal对象。
- get():T、获取当前线程专属ThreadLocalMap的对应键为当前ThreadLocal对象的值T。
- remove():void、删除当前线程专属ThreadLocalMap的对应键为当前ThreadLocal对象的k-v对。
- createMap(Thread, T):void、为线程创建其专属的ThreadLocalMap对象，当前线程还没有专属的ThreadLocalMap对象才调用该方法。
- getMap(Thread):ThreadLocalMap、获得指定线程的专属ThreadLocalMap对象。

**以下的两点很妙，它们才是实现每条线程都有自己的数据副本的关键：**
- ThreadLocal不持有ThreadLocalMap对象，而是让每个Thread去持有一个ThreadLocalMap对象
- ThreadLocalMap的键是一个ThreadLocal对象

###### 按上面的理解，一个ThreadLocal对象最大能对应的数据范围就只有当前线程的专属储存容器(TheadLocalMap)中一个key-value对，key为其本身，value为TheadLocal中的T型对象，ThreadLocal<T>l是一个泛型类，泛型T就是为了声明线程的专属储存容器(TheadLocalMap)中它本身为key所对应的value的数据类型。就像shiro的ThreadContext类中定义的ThreadLocal<Map<Object, Object>> resources，T的声明类型就是Map<Object, Object>。

小结以下关系：
- 一个Thread拥有一个专属的储存容器TheadLocalMap，它类似于HashMap
- Thread不操作TheadLocalMap。
- ThreadLocalMap才是最终实现数据储存与操作的地方。
- TheadLocal是ThreadLocalMap中的key。
- 一条线程有可以有好多个TheadLocal与它对应的数据。
- TheadLocal定义了数据操作的方法，但它并非最终操作数据的地方，它主要是作用以本身为key串接当前线程的ThreadLocalMap，最终操作还得落在TheadLocalMap上。
- ThreadLocal是一个泛型，可以声明本身这个TheadLocal在ThreadLocalMap中对应的数据类型，若这个泛型声明Map，那就是线程有一个类型Map的结构储存数据，而Map中的一个value又是一个Map，双重Map结构。

ThreadLocal作为使用这套功能的主切入点，我不知道应该如何描述ThreadLocal在Thread、TheadLocalMap，TheadLocalMap.Entry的位置，就用主切入点这个词，从代码实现上看，TheadLocalMap是完成了最多工作的，而我们从各种文档（包括官方文档）中都看到，都是以ThreadLocal为主角在叙述的，因为使用方只需要对ThreadLocal操作即可，它作为一个key不但声明其value的类型了，还提供了操作其value的方法（set、get、remove），且这些方法的参数最多只涉及到其声明的value类型，这样这套API显得很简洁了。

ThreadContext中的InheritableThreadLocalMap继承自InheritableThreadLocal，那它又是干什么用的呢？
参考：[InheritableThreadLocal详解](https://www.jianshu.com/p/94ba4a918ff5)

Thread类有个inheritableThreadLocals变量，是ThreadLocalMap类型，它用于拷贝父线程的数据到本线程，在init方法判断本线程有inheritableThreadLocals变量且父线程的inheritableThreadLocals不为空的话，就为本线程有inheritableThreadLocals变量创建ThreadLocalMap且把父线程的inheritableThreadLocals的数据拷贝到其中，这里要注意：是把拷贝的是
父线程的inheritableThreadLocals的数据，而父线程的threadLocals的数据，也就是说一个线程的数据只有被放在inheritableThreadLocals中，才可能被其子线程拷贝过去。

Thread已经完成了从父线程拷贝数据的功能，那为什么还用InheritableThreadLocal类呢？

首先，InheritableThreadLocal继承自ThreadLocal的，ThreadLocal除了可以操作它作为threadLocals一个key所对应value数据外（set、get、remove），还可以获取和创建整个threadLocals（getMap、createMap）；**而InheritableThreadLocal作为一个key，它操作的是inheritableThreadLocals的数据，原因就在这3个重写的方法：childValue、getMap、createMap，childValue在ThreadLocal中没有实现，只抛了个异常，在InheritableThreadLocal也只是直接把传入数据返回了，InheritableThreadLocal的getMap返回的线程的inheritableThreadLocals，createMap是为inheritableThreadLocals创建了ThreadLocalMap**

理解ThreadLocal的相关技术，可以说回shiro的ThreadContext了，它的resources变量虽然声明为ThreadLocal类型，但它初始化为InheritableThreadLocalMap类型（虽然名字中带了个Map，但它是InheritableThreadLocal的子类），也只是重写了childValue方法，限定了数据类型为Map<Object, Object>。**这里为什么要初始化为InheritableThreadLocal的子类呢？我想只可能是想从父线程拷贝数据了，这还得研究shiro-web的代码才能得到答案了，待后续研究了...**

resources变量其实就是线程的ThreadLocalMap（类似哈希表）中的一个key，之所以用resources这个名字，是因为这个key对应的value是Map<Object, Object>。而在这个Map<Object, Object>中，ThreadContext给定义了两个key，一个给subject，另一个给securityManager。明白了这一点，ThreadContext中的方法也只能理解了。

回来问题的原点：REST环境中前后两次访问API时调用SecurityUtils.getSubject().hashCode()得到结果不一致，只能说明前后两次的访问是已经是在不同的线程中了。

















