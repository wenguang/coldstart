**问题1：**在用前端访问/manage/permission/hello时，根据断点的顺序判断，先执行扩展自servlet的跨域过滤器CORSFilter，再执行扩展自shiro的跨域过滤器CORSShiroFilter，这和shiro的过滤链前于servlet容器自身的过滤链有矛盾。

**问题2：**在前端访问login接口成功后，接下来访问/manage/permission/hello（该路径要通过认证才能访问），在认证过滤器中subject.isAuthenticated()为false。这位老兄似乎也遇到这个问题：https://stackoverflow.com/questions/52987183/client-side-ajax-call-on-cors-server-doesnt-include-credentials。

**问题3：**Request Headers中出现Provisional headers are shown。

**问题4：**Access to XMLHttpRequest at 'http://localhost:1111/manage/permission/hello' from origin 'http://localhost:8002' has been blocked by CORS policy: Response to preflight request doesn't pass access control check: Redirect is not allowed for a preflight request.



只要把shiro过滤链中的这句注释掉：/manage/** = cors,upmsSessionForceLogout,authc，也就是不用通过shiro认证，就把访问成功。这说明问题出在这几个过滤器的实现上。



**问题5：**当把/manage/** = cors,upmsSessionForceLogout,authc改成/manage/** = cors，跨域访问被允许了，但返回的结果是{"code":0,"data":"Unauthoncationed","message":"failed"}，即执行了CORSShiroFilter的saveRequestAndRedirectToLogin方法，因为CORSShiroFilter是继承自UserFilter的，UserFilter的类注释是这样的：

```
 Filter that allows access to resources if the accessor is a known user, which is defined as
 * having a known principal.  This means that any user who is authenticated or remembered via a
 * 'remember me' feature will be allowed access from this filter.
 * <p/>
 * If the accessor is not a known user, then they will be redirected to the {@link #setLoginUrl(String) loginUrl}</p
```

即便我重新调用/sso/login接口后，再访问/manage/permission/hello还是这样结果。也就是出现了**问题2**，