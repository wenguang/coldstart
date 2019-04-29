

以/sso/login接口为例子，用fetch.js(XMLHttpRequest)向JAVA接口POST数据，HttpServletRequest.getParameter('username')为null，调试器中看到HttpServletRequest的parameters属性下有一个元素，但它的key为前端发送的整个json的字符串{'username':'zheng','password':'123'}。但是用Postman向后端接口POST同样的数据（HTTP Header都一样），HttpServletRequest.getParameter('username')是可以获取到数据的，为什么呢？

Postman的方式相当于提交表单，它和ajax的方式不同？可读以下文章看能否有启发
[$.ajax contenType是appliation/json的时候，spring mvc后台无法接受data参数](https://blog.csdn.net/G1248019684/article/details/50850386)
[AJAX POST请求中参数以form data和request payload形式在servlet中的获取方式](https://blog.csdn.net/mhmyqn/article/details/25561535)

既然HttpServletRequest.getParameter的方法不行，那就用读取流的方式
```
public static Map<String, Object> getPostParameterFromRequest(HttpServletRequest request) {
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
    return null;
}
```
同时前端的Context-type设置为'application/json;charset=UTF=8'