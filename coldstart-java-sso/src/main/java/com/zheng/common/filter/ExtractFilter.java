package com.zheng.common.filter;

import com.zheng.common.util.RequestUtil;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class ExtractFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletRequest extractedRequest = RequestUtil.extractParam(request);
        filterChain.doFilter(extractedRequest, servletResponse);
    }

    @Override
    public void destroy() {

    }
}
