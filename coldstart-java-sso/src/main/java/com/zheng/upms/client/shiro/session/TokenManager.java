package com.zheng.upms.client.shiro.session;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.zheng.common.util.RedisUtil;
import com.zheng.upms.client.util.SerializableUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class TokenManager {

    private static final Logger LOGGER = LoggerFactory.getLogger(TokenManager.class);
    private static final String SSO_ACCESS_TOKEN_ID_PREFIX = "SSO_ACCESS_TOKEN_ID_";

    public static String createAccessToken() {
        AccessToken accessToken = new AccessToken();
        String token = accessToken.getToken();
        RedisUtil.set(SSO_ACCESS_TOKEN_ID_PREFIX + token, SerializableUtil.serializeAccessToken(accessToken));
        return token;
    }

    public static boolean setAccessToken(AccessToken accessToken) {
        if (accessToken != null) {
            String token = accessToken.getToken();
            RedisUtil.set(SSO_ACCESS_TOKEN_ID_PREFIX + token, SerializableUtil.serializeAccessToken(accessToken));
        }
        return false;
    }

    public static void removeAccessToken(String token) {
        RedisUtil.remove(SSO_ACCESS_TOKEN_ID_PREFIX + token);
    }

    public static boolean isTokenActive(String token) {
        if (StringUtils.isBlank(token)) {
            return false;
        }
        String accessTokenStr = RedisUtil.get(SSO_ACCESS_TOKEN_ID_PREFIX + token);
        if (StringUtils.isBlank(accessTokenStr)) {
            return false;
        }
        AccessToken accessToken = SerializableUtil.deserializeAccessToken(accessTokenStr);
        if (accessToken.isExpired()) {
            RedisUtil.remove(SSO_ACCESS_TOKEN_ID_PREFIX + token);
            return false;
        }
        return true;
    }

    public static boolean updateAccessToken(String token) {
        if (StringUtils.isBlank(token)) {
            return false;
        }
        String accessTokenStr = RedisUtil.get(SSO_ACCESS_TOKEN_ID_PREFIX + token);
        if (StringUtils.isBlank(accessTokenStr)) {
            return false;
        }
        AccessToken accessToken = SerializableUtil.deserializeAccessToken(accessTokenStr);
//        if (accessToken.isExpired()) {
//            RedisUtil.remove(SSO_ACCESS_TOKEN_ID_PREFIX + token);
//            return false;
//        }
        accessToken.updateStartTime();
        RedisUtil.set(SSO_ACCESS_TOKEN_ID_PREFIX + token, SerializableUtil.serializeAccessToken(accessToken));
        return true;
    }

    public static AccessToken getAccessToken(String token) {
        if (StringUtils.isBlank(token)) {
            return null;
        }
        String accessTokenStr = RedisUtil.get(SSO_ACCESS_TOKEN_ID_PREFIX + token);
        if (StringUtils.isBlank(accessTokenStr)) {
            return null;
        }
        AccessToken accessToken = SerializableUtil.deserializeAccessToken(accessTokenStr);
        return accessToken;
    }
}
