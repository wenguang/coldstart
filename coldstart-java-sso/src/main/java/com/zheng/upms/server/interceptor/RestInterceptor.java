package com.zheng.upms.server.interceptor;

import com.zheng.common.util.PropertiesFileUtil;
import com.zheng.upms.dao.model.UpmsUser;
import com.zheng.upms.service.UpmsApiService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RestInterceptor extends HandlerInterceptorAdapter {
    private static final Logger LOGGER = LoggerFactory.getLogger(UpmsInterceptor.class);
//    private static final String ZHENG_OSS_ALIYUN_OSS_POLICY = PropertiesFileUtil.getInstance("zheng-oss-client").get("zheng.oss.aliyun.oss.policy");

    @Autowired
    UpmsApiService upmsApiService;


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String username = "";
        UpmsUser upmsUser = username != null ? upmsApiService.selectUpmsUserByUsername(username) : null;
        request.setAttribute("upmsUser", upmsUser);
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        super.afterCompletion(request, response, handler, ex);
    }

    @Override
    public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        super.afterConcurrentHandlingStarted(request, response, handler);
    }

}
