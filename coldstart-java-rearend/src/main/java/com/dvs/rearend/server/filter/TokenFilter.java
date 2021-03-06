package com.dvs.rearend.server.filter;

import com.dvs.rearend.common.constant.UpmsResult;
import com.dvs.rearend.common.constant.UpmsResultConstant;
import com.dvs.rearend.common.util.RequestUtil;
import com.dvs.rearend.common.util.ResponseUtil;
import com.dvs.rearend.server.token.TokenManager;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

public class TokenFilter implements Filter {

    private final static String SSO_LOGIN_URL = "http://localhost:8002";

    @Override
    public void init(FilterConfig filterConfig) {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        if (request.getMethod().equalsIgnoreCase("GET") || request.getMethod().equalsIgnoreCase("POST")) {
            String accessTokenId = RequestUtil.getExtractedParamFromRequest(request, "token");
            if (TokenManager.isTokenActive(accessTokenId)) {
                TokenManager.updateAccessToken(accessTokenId);
            } else {
                HashMap map = new HashMap();
                map.put("msg", "token失效");
                map.put("redirectUrl", SSO_LOGIN_URL);
                UpmsResult ret = new UpmsResult(UpmsResultConstant.INVALID_TOKEN, map);
                ResponseUtil.returnTo(response, ret);
                return;
            }
        }
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {

    }
}