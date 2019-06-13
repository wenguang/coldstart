package com.zheng.upms.client.shiro.session;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.UUID;

//@Setter
//@Getter
//@AllArgsConstructor
public class AccessToken implements Serializable {

    private final static long EXPIRE_TIME = 10 * 1000;
    private String token;
    private Long startTime;

    public AccessToken() {
        this.token = UUID.randomUUID().toString();
        this.startTime = Long.valueOf(System.currentTimeMillis());
    }

    public boolean isExpired() {
        synchronized (this.startTime) {
            long now = System.currentTimeMillis();
            if (now - this.startTime.longValue() >= EXPIRE_TIME) {
                return true;
            }
            return false;
        }
    }

    public void updateStartTime() {
        synchronized (this.startTime) {
            this.startTime = Long.valueOf(System.currentTimeMillis());
        }
    }

//    public AccessToken(String token, String startTime) {
//        this.token = token;
//        this.startTime = startTime;
//    }
//    public void setToken(String token) {
//        this.token = token;
//    }
    public String getToken() {
        return this.token;
    }
//    public void setStartTime(String startTime) {
//        this.startTime = startTime;
//    }
    public Long getStartTime() {
        return this.startTime;
    }


}
