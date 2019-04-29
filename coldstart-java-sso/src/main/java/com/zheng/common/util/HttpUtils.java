package com.zheng.common.util;

import com.alibaba.fastjson.JSON;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.util.Map;

public class HttpUtils {

    private static final Logger LOGGER = LoggerFactory.getLogger(HttpUtils.class);

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
}
