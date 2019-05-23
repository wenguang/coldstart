REST是强调无状态的，那该如何与shiro整合呢？

用ajax方式调用接口，发现每次调用SecurityUtils.getSubject().getSession().getId()都会产生不同的的值，也就是会话状态无法延续。**这才是调用/sso/login接口成功再调用别的接口（只要该接口要经shiro验证）都会出现subject.isAuthenticationed()返回false的真正原因**，即使只通过CORSShiroFilter过滤器也不行，CORSShiroFilter继承自UserFilter，而UserFilter明确说明：Filter that allows access to resources if the accessor is a known user，当会话无法延续了，shiro就无法知道你是否为先前登录过的 known user了。