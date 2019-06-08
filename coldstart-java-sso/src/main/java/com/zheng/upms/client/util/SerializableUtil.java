package com.zheng.upms.client.util;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.zheng.upms.client.shiro.session.AccessToken;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.session.Session;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

/**
 * session序列化工具
 * Created by shuzheng on 2017/3/12.
 */
public class SerializableUtil {

    public static String serializeAccessToken(AccessToken accessToken) {
        if (null == accessToken) {
            return null;
        }
        try {
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            ObjectOutputStream oos = new ObjectOutputStream(bos);
            oos.writeObject(accessToken);
            return Base64.encodeToString(bos.toByteArray());
        } catch (Exception e) {
            throw new RuntimeException("serializeSession accessToken error", e);
        }
    }

    public static AccessToken deserializeAccessToken(String accessTokenStr) {
        if (StringUtils.isBlank(accessTokenStr)) {
            return null;
        }
        try {
            ByteArrayInputStream bis = new ByteArrayInputStream(Base64.decode(accessTokenStr));
            ObjectInputStream ois = new ObjectInputStream(bis);
            return (AccessToken) ois.readObject();
        } catch (Exception e) {
            throw new RuntimeException("deserializeSession accessToken error", e);
        }
    }

    public static String serializeSession(Session session) {
        if (null == session) {
            return null;
        }
        try {
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            ObjectOutputStream oos = new ObjectOutputStream(bos);
            oos.writeObject(session);
            return Base64.encodeToString(bos.toByteArray());
        } catch (Exception e) {
            throw new RuntimeException("serializeSession session error", e);
        }
    }

    public static Session deserializeSession(String sessionStr) {
        if (StringUtils.isBlank(sessionStr)) {
            return null;
        }
        try {
            ByteArrayInputStream bis = new ByteArrayInputStream(Base64.decode(sessionStr));
            ObjectInputStream ois = new ObjectInputStream(bis);
            return (Session) ois.readObject();
        } catch (Exception e) {
            throw new RuntimeException("deserializeSession session error", e);
        }
    }

}
