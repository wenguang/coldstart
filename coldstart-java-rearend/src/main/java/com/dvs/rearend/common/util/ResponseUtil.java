package com.dvs.rearend.common.util;

import com.alibaba.fastjson.JSONObject;
import com.dvs.rearend.common.constant.UpmsResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class ResponseUtil {
    private static final Logger LOGGER = LoggerFactory.getLogger(ResponseUtil.class);

    public static void returnTo(ServletResponse response, String data) throws IOException {
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println(data);
        out.flush();
        out.close();
    }

    public static void returnTo(ServletResponse response, UpmsResult result) throws IOException {
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println(JSONObject.toJSONString(result));
        out.flush();
        out.close();
    }
}
