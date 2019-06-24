package com.dvs.rearend.common.filter;

import com.dvs.rearend.common.util.RequestUtil;

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
        if (request.getMethod().equalsIgnoreCase("GET") || request.getMethod().equalsIgnoreCase("POST")) {
            HttpServletRequest extractedRequest = RequestUtil.extractParam(request);
            filterChain.doFilter(extractedRequest, servletResponse);
        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {

    }
}
