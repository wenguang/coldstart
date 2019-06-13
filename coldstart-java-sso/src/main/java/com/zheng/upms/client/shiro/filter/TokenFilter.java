package com.zheng.upms.client.shiro.filter;

import com.zheng.common.constant.UpmsResult;
import com.zheng.common.constant.UpmsResultConstant;
import com.zheng.common.util.RequestUtil;
import com.zheng.common.util.ResponseUtil;
import com.zheng.upms.client.shiro.session.TokenManager;
import org.apache.shiro.web.filter.authc.AuthenticationFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class TokenFilter extends AuthenticationFilter {
    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {
        HttpServletRequest req = (HttpServletRequest)request;
        if (req.getMethod().equalsIgnoreCase("GET") || req.getMethod().equalsIgnoreCase("POST")) {
            String accessTokenId = RequestUtil.getExtractedParamFromRequest(req, "token");
            if (TokenManager.isTokenActive(accessTokenId)) {
                return TokenManager.updateAccessToken(accessTokenId);
            } else {
                return false;
            }
        }
        return true;
    }

    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws IOException {
        HttpServletRequest req = (HttpServletRequest)request;
        UpmsResult ret = new UpmsResult(UpmsResultConstant.INVALID_TOKEN, "token失效");
        ResponseUtil.returnTo(response, ret);
        return false;
    }
}
