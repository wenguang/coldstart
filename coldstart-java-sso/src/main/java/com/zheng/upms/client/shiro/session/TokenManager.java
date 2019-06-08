package com.zheng.upms.client.shiro.session;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.zheng.common.util.RedisUtil;
import com.zheng.upms.client.util.SerializableUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class TokenManager {

    private static final Logger LOGGER = LoggerFactory.getLogger(TokenManager.class);
    private static final String CS_ACCESS_TOKEN_ID = "CS_ACCESS_TOKEN_ID_";

    public static String createAccessToken() {
        AccessToken accessToken = new AccessToken();
        String accessTokenId = CS_ACCESS_TOKEN_ID + accessToken.getToken();
        RedisUtil.set(accessTokenId, SerializableUtil.serializeAccessToken(accessToken));
        return accessTokenId;
    }

    public static boolean updateAccessToken(String accessTokenId) {
        if (StringUtils.isBlank(accessTokenId)) {
            return false;
        }
        String accessTokenStr = RedisUtil.get(accessTokenId);
        if (StringUtils.isBlank(accessTokenStr)) {
            return false;
        }
        AccessToken accessToken = SerializableUtil.deserializeAccessToken(accessTokenStr);
        if (accessToken.isExpired()) {
            RedisUtil.remove(accessTokenId);
            return false;
        }
        accessToken.updateStartTime();
        RedisUtil.set(accessTokenId, SerializableUtil.serializeAccessToken(accessToken));
        return true;
    }

}
