在前端访问login接口成功后，接下来访问/manage/permission/hello（该路径要通过认证才能访问），在认证过滤器中subject.isAuthenticated()为false。每次访问接口，SecurityUtils.getSubject().hashCode()都不同，



#### REST是强调无状态的，那该如何与shiro整合呢？

用ajax方式调用接口，发现每次调用SecurityUtils.getSubject().getSession().getId()都会产生不同的的值，也就是会话状态无法延续。**这才是调用/sso/login接口成功再调用别的接口（只要该接口要经shiro验证）都会出现subject.isAuthenticationed()返回false的真正原因**，即使只通过CORSShiroFilter过滤器也不行，CORSShiroFilter继承自UserFilter，而UserFilter明确说明：Filter that allows access to resources if the accessor is a known user，当会话无法延续了，shiro就无法知道你是否为先前登录过的 known user了。

##### 让shiro不创建session
改造securityManager中的SubjectFactory，DefaultSecurityManager对象持有一个SubjectFactory接口，它用来创建subject的，先来看看DefaultWebSubjectFactory创建subject的实现：
```
public Subject createSubject(SubjectContext context) {
    if (!(context instanceof WebSubjectContext)) {
        return super.createSubject(context);
    }
    WebSubjectContext wsc = (WebSubjectContext) context;
    SecurityManager securityManager = wsc.resolveSecurityManager();
    Session session = wsc.resolveSession();
    //是否创建了session，关键就在下面这句
    boolean sessionEnabled = wsc.isSessionCreationEnabled();
    PrincipalCollection principals = wsc.resolvePrincipals();
    boolean authenticated = wsc.resolveAuthenticated();
    String host = wsc.resolveHost();
    ServletRequest request = wsc.resolveServletRequest();
    ServletResponse response = wsc.resolveServletResponse();

    return new WebDelegatingSubject(principals, authenticated, host, session, sessionEnabled,
            request, response, securityManager);
}
```
下面就新一个类继承自DefaultWebSubjectFactory，在createSubject内把sessionCreationEnabled设置false
```
public class TestSubjectFactory extends DefaultWebSubjectFactory {
    public Subject createSubject(SubjectContext context) {
        context.setSessionCreationEnabled(false);
        return super.createSubject(context);
    }
}
```
修改配置
```
<bean id="securityManager" class="org.apache.shiro.web.mgt.DefaultWebSecurityManager">
    <property name="subjectFactory" ref="testSubjectFactory"/>
</bean>

<!-- 改造SubjectFactory，让shiro不创建session -->
<bean id="testSubjectFactory" class="com.zheng.upms.client.shiro.subject.TestSubjectFactory"/>
```

参考：[shiro jwt 构建无状态分布式鉴权体系](https://www.jianshu.com/p/0a5d3d07a151)

##### 让shiro不创建session不意味着问题就解决了
因为每次访问接口，都会访问到不同的subject，SecurityUtils.getSubject().hashCode()每次都不同，所以问题仍然存在，**那就是如何把保证登录成功的用户再访问接口的延续性问题。**

