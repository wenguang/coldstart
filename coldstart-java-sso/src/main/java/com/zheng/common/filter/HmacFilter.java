package com.zheng.common.filter;

import com.alibaba.fastjson.JSONObject;
import com.zheng.common.constant.UpmsResult;
import com.zheng.common.constant.UpmsResultConstant;
import com.zheng.common.util.AESUtil;
import com.zheng.common.util.RequestUtil;
import org.apache.commons.codec.binary.Hex;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.crypto.Mac;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

public class HmacFilter implements Filter {

    private static final Logger LOGGER = LoggerFactory.getLogger(HmacFilter.class);

    private static final String APIID = "apiId";
    private static final String TIMESTAMP = "timestamp";
    private static final String DIGEST = "digest";

    private final static String API_KEY = "haha43420024";

    @Override
    public void init(FilterConfig filterConfig) {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;

        if (request.getMethod().equalsIgnoreCase("GET") || request.getMethod().equalsIgnoreCase("POST")) {

            String apiId = RequestUtil.getExtractedParamFromRequest(request, APIID);
            String timestamp = RequestUtil.getExtractedParamFromRequest(request, TIMESTAMP);
            String digest = RequestUtil.getExtractedParamFromRequest(request, DIGEST);

            // apiId、timestamp、digest这3个参数是必要的
            if (StringUtils.isBlank(apiId) || StringUtils.isBlank(timestamp) || StringUtils.isBlank(digest)) {
                responseTo(response, "缺少必要的参数");
            } else {
                Map<String, String> paramMap = RequestUtil.getExtractedParamMapFromRequest(request);
                Set<String> keySet = paramMap.keySet();
                List<String> keyList = new ArrayList<>(keySet);
                Collections.sort(keyList);
                String baseString = "";
                for (int i = 0; i < keyList.size(); i++) {
                    String key = keyList.get(i);
                    if (!key.equals(APIID) && !key.equals(TIMESTAMP) && !key.equals(DIGEST)) {
                        baseString += paramMap.get(key);
                    }
                }
                baseString += apiId;
                baseString += timestamp;

                String digest2 = AESUtil.hmacDigest(baseString);
                if (!digest.equals(digest2)) {
                    responseTo(response, "参数被篡改过");
                }
            }
        }

        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {

    }

    /**
     * 过滤失败，返回错误信息给前端
     */
    private static void responseTo(HttpServletResponse response, String data) throws IOException {
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println(JSONObject.toJSONString(new UpmsResult(UpmsResultConstant.FAILED, data)));
        out.flush();
        out.close();
    }

    /**
     *  使用HMAC摘要算法和秘钥API KEY生成数组摘要
     */
//    private static String hmacDigest(String data) {
//
//        String checksum = null;
//        try {
//            byte[] appKeyByte = API_KEY.getBytes("UTF-8");
//            byte[] dataByte = data.getBytes("UTF-8");
//            SecretKey secretKey = new SecretKeySpec(appKeyByte, "HmacMD5");
//
//            Mac mac = Mac.getInstance("HmacMD5");
//            mac.init(secretKey);
//            byte[] doFinal = mac.doFinal(dataByte);
//            byte[] hexB = new Hex().encode(doFinal);
//
//            checksum = new String(hexB);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return checksum;
//    }

}
