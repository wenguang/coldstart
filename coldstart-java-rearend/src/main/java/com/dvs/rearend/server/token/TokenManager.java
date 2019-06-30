package com.dvs.rearend.server.token;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.fastjson.JSONObject;
import com.dvs.rearend.common.constant.UpmsResult;
import com.dvs.rearend.common.constant.UpmsResultConstant;
import com.dvs.rearend.common.util.RedisUtil;
import com.dvs.rearend.server.util.SerializableUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.Map;

public class TokenManager {

    private static final Logger LOGGER = LoggerFactory.getLogger(TokenManager.class);
    private static final String CS_ACCESS_TOKEN_ID_PREFIX = "CS_ACCESS_TOKEN_ID_";

    public static String createAccessToken() {
        AccessToken accessToken = new AccessToken();
        String token = accessToken.getToken();
        RedisUtil.set(CS_ACCESS_TOKEN_ID_PREFIX + token, SerializableUtil.serializeAccessToken(accessToken));
        return token;
    }

    public static boolean setAccessToken(AccessToken accessToken) {
        if (accessToken != null) {
            String token = accessToken.getToken();
            RedisUtil.set(CS_ACCESS_TOKEN_ID_PREFIX + token, SerializableUtil.serializeAccessToken(accessToken));
        }
        return false;
    }

    public static void removeAccessToken(String token) {
        RedisUtil.remove(CS_ACCESS_TOKEN_ID_PREFIX + token);
    }

    public static boolean isTokenActive(String token) {
        if (StringUtils.isBlank(token)) {
            return false;
        }
        String accessTokenStr = RedisUtil.get(CS_ACCESS_TOKEN_ID_PREFIX + token);
        if (StringUtils.isBlank(accessTokenStr)) {
            return false;
        }
        AccessToken accessToken = SerializableUtil.deserializeAccessToken(accessTokenStr);
        if (accessToken.isExpired()) {
            RedisUtil.remove(CS_ACCESS_TOKEN_ID_PREFIX + token);
            return false;
        }
        return true;
    }

    public static boolean updateAccessToken(String token) {
        if (StringUtils.isBlank(token)) {
            return false;
        }
        String accessTokenStr = RedisUtil.get(CS_ACCESS_TOKEN_ID_PREFIX + token);
        if (StringUtils.isBlank(accessTokenStr)) {
            return false;
        }
        AccessToken accessToken = SerializableUtil.deserializeAccessToken(accessTokenStr);
//        if (accessToken.isExpired()) {
//            RedisUtil.remove(CS_ACCESS_TOKEN_ID_PREFIX + token);
//            return false;
//        }
        accessToken.updateStartTime();
        RedisUtil.set(CS_ACCESS_TOKEN_ID_PREFIX + token, SerializableUtil.serializeAccessToken(accessToken));
        return true;
    }

    public static void main(String[] args) {
        String content = "{\"code\":1,\"message\":\"success\",\"data\":{\"token\":\"0342b9d3-2525-42f6-b5fb-f26f18d7670c\",\"startTime\":1561869011599,\"expired\":false}}";
        JSONObject jsonObject = JSONObject.parseObject(content);
//        int code = Integer.parseInt(jsonObject.get("code").toString());
//        System.out.println(code);
//        String message = jsonObject.get("message").toString();
//        System.out.println(message);
//        String data = jsonObject.get("data").toString();
//        UpmsResult ret = null;
//        if (code == 1) {
//            JSONObject jsonObject1 = JSONObject.parseObject(data);
//            String token = jsonObject1.get("token").toString();
//            long startTime = Long.parseLong(jsonObject1.get("startTime").toString());
//            AccessToken accessToken = new AccessToken(token, startTime);
//            ret = new UpmsResult(UpmsResultConstant.SUCCESS, accessToken);
//        } else {
//            UpmsResultConstant constant = UpmsResultConstant.FAILED;
//            constant.code = code;
//            constant.message = message;
//            ret = new UpmsResult(constant, data);
//        }
//        System.out.println(ret);
    }
}
