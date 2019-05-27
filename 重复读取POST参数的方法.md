
如果是GET请求，用HttpServetRequest的getParameter(paramName)方法就可读取到参数。如果是POST请求，读取参数就麻烦一些，下面是用流的读取，这种方法只能读取一次，因为流读完后就没有了。
```
String str, wholeStr = "";
try {
    BufferedReader br = request.getReader();
    while ((str = br.readLine()) != null) {
        wholeStr += str;
    }
    if (StringUtils.isNotBlank(wholeStr)) {
        return JSON.parseObject(wholeStr, Map.class);
    }
} catch (Exception e) {
    LOGGER.error("", e);
}
```
有些场景是需要重复读取POST参数的，我的作法是实现一个servet的filter，用流的方式读取参数，然后把这些参数设置在HttpServletRequest的attribute属性中，这是可以重复读取了。ExtractFilter就实现了该功能。
```
public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
    HttpServletRequest request = (HttpServletRequest)servletRequest;
    HttpServletRequest extractedRequest = RequestUtil.extractParam(request);
    filterChain.doFilter(extractedRequest, servletResponse);
}
```
注意在web.xml配置filter时，要放在其他需要读取参数的filter前面，比如API鉴权filter
