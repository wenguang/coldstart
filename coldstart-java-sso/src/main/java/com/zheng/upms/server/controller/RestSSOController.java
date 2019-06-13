package com.zheng.upms.server.controller;

import com.zheng.common.base.BaseController;
import com.zheng.common.constant.UpmsResult;
import com.zheng.common.constant.UpmsResultConstant;
import com.zheng.common.util.RequestUtil;
import com.zheng.upms.client.shiro.session.TokenManager;
import com.zheng.upms.dao.model.UpmsUser;
import com.zheng.upms.service.UpmsApiService;
import com.zheng.upms.service.UpmsSystemService;
import com.zheng.upms.service.UpmsUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/sso")
@Api(value = "单点登录管理", description = "单点登录管理")
public class RestSSOController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(RestSSOController.class);

    @Autowired
    UpmsApiService upmsApiService;

    @Autowired
    UpmsSystemService upmsSystemService;

    @Autowired
    UpmsUserService upmsUserService;

    @ApiOperation(value = "登录")
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Object login(HttpServletRequest request, HttpServletResponse response) {

        String username = RequestUtil.getExtractedParamFromRequest(request, "username");
        String password = RequestUtil.getExtractedParamFromRequest(request, "password");

        if (StringUtils.isBlank(username)) {
            return new UpmsResult(UpmsResultConstant.EMPTY_USERNAME, "帐号不能为空！");
        }
        if (StringUtils.isBlank(password)) {
            return new UpmsResult(UpmsResultConstant.EMPTY_PASSWORD, "密码不能为空！");
        }
        Subject subject = SecurityUtils.getSubject();

        // 使用shiro认证
        UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(username, password);
        try {
            subject.login(usernamePasswordToken);
        } catch (UnknownAccountException e) {
            return new UpmsResult(UpmsResultConstant.INVALID_USERNAME, "帐号不存在！");
        } catch (IncorrectCredentialsException e) {
            return new UpmsResult(UpmsResultConstant.INVALID_PASSWORD, "密码错误！");
        } catch (LockedAccountException e) {
            return new UpmsResult(UpmsResultConstant.INVALID_ACCOUNT, "帐号已锁定！");
        } catch (Exception e) {
            e.printStackTrace();
            return new UpmsResult(UpmsResultConstant.FAILED, e.getMessage());
        }

        // 更新Token状态

        // 返回一些用户信息给前端以作为调用其他API的参数用
        UpmsUser upmsUser = upmsApiService.selectUpmsUserByUsername(username);
        Map ret = new HashMap();
        ret.put("id", upmsUser.getUserId());
        ret.put("username", upmsUser.getUsername());
        ret.put("token", TokenManager.createAccessToken());
        return new UpmsResult(UpmsResultConstant.SUCCESS, ret);
    }
}
