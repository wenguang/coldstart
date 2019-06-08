package com.zheng.upms.client.shiro;

import com.zheng.common.util.RedisUtil;
import com.zheng.upms.client.shiro.session.AccessToken;
import com.zheng.upms.client.util.SerializableUtil;

public class ShiroTester {
    public static void main(String[] args) {
        String token = "123456";
        Long l = Long.valueOf("88888888888");
        RedisUtil.remove(token);

        AccessToken accessToken = new AccessToken();
//        AccessToken accessToken = new AccessToken();
//        accessToken.setToken(token);
//        accessToken.setStartTime(l);
//        RedisUtil.set(token, SerializableUtil.serializeAccessToken(accessToken));
//        String str = RedisUtil.get(token);
//        AccessToken at = SerializableUtil.deserializeAccessToken(str);
        System.out.println(accessToken.isExpired());
//        System.out.println(accessToken);
    }
}
