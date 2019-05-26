package com.zheng.upms.server.controller;

import com.zheng.common.base.BaseController;
import com.zheng.common.constant.UpmsResult;
import com.zheng.common.constant.UpmsResultConstant;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "ns")
public class NoSessionController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(NoSessionController.class);

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    @ResponseBody
    public Object hello() {
        Subject subject = SecurityUtils.getSubject();
//        Session session = subject.getSession();
//        String sessionId = session.getId().toString();

        System.out.println("subject's hasCode = " + subject.hashCode());
        return new UpmsResult(UpmsResultConstant.SUCCESS, subject.hashCode());
    }
}
