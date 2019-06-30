package com.dvs.rearend.server.controller;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.fastjson.JSONObject;
import com.dvs.rearend.common.base.BaseController;
import com.dvs.rearend.common.constant.UpmsResult;
import com.dvs.rearend.common.constant.UpmsResultConstant;
import com.dvs.rearend.common.util.RedisUtil;
import com.dvs.rearend.common.util.RequestUtil;
import com.dvs.rearend.server.Constant;
import com.dvs.rearend.server.token.AccessToken;
import com.dvs.rearend.server.token.TokenManager;
import com.sun.javafx.fxml.builder.URLBuilder;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/token")
public class TokenController extends BaseController {

    @RequestMapping(value = "/receive", method = RequestMethod.POST)
    @ResponseBody
    public Object receive(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, IOException, ClientProtocolException, URISyntaxException {
        String token = RequestUtil.getExtractedParamFromRequest(request, "token");
        String apiId = RequestUtil.getExtractedParamFromRequest(request, "apiId");
        String timestamp = RequestUtil.getExtractedParamFromRequest(request, "timestamp");
        String digest = RequestUtil.getExtractedParamFromRequest(request, "digest");

        if (StringUtils.isBlank(token)) {
            return new UpmsResult(UpmsResultConstant.FAILED, "token不能为空");
        }
        else {
            //参考：https://www.jianshu.com/p/375be5929bed
            CloseableHttpClient httpClient = HttpClients.createDefault();
            URI uri = new URI(Constant.SSO_URL + "/sso/verify?token=" + token + "&apiId=" + apiId + "&timestamp=" + timestamp + "&digest=" + digest);
            HttpGet httpGet = new HttpGet(uri);

//            HttpPost httpPost = new HttpPost(Constant.SSO_URL + "/sso/verify");
//            List<NameValuePair> parameters = new ArrayList<>();
//            parameters.add(new BasicNameValuePair("token", token));
//            parameters.add(new BasicNameValuePair("apiId", apiId));
//            parameters.add(new BasicNameValuePair("timestamp", timestamp));
//            parameters.add(new BasicNameValuePair("digest", digest));
//            UrlEncodedFormEntity formEntity = new UrlEncodedFormEntity(parameters);
//            httpPost.setEntity(formEntity);

            //伪装浏览器
//            httpPost.setHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36");
            CloseableHttpResponse closeableHttpResponse = null;
            UpmsResult upmsResult = new UpmsResult(UpmsResultConstant.FAILED, "验证token失败");
            try {
                closeableHttpResponse = httpClient.execute(httpGet);
                if (closeableHttpResponse.getStatusLine().getStatusCode() == 200) {
                    String content = EntityUtils.toString(closeableHttpResponse.getEntity(), "UTF-8");
                    JSONObject jsonObject = JSONObject.parseObject(content);
                    int code = Integer.parseInt(jsonObject.get("code").toString());
                    String message = jsonObject.get("message").toString();
                    String data = jsonObject.get("data").toString();
                    UpmsResult ret = null;
                    if (code == 1) {
                        JSONObject jsonObject1 = JSONObject.parseObject(data);
                        String token1 = jsonObject1.get("token").toString();
                        long startTime = Long.parseLong(jsonObject1.get("startTime").toString());
                        AccessToken accessToken = new AccessToken(token1, startTime);
                        TokenManager.setAccessToken(accessToken);
                        ret = new UpmsResult(UpmsResultConstant.SUCCESS, accessToken);
                    } else {
                        UpmsResultConstant constant = UpmsResultConstant.FAILED;
                        constant.code = code;
                        constant.message = message;
                        ret = new UpmsResult(constant, data);
                    }
                    return ret;
                }
            } finally {
                if (closeableHttpResponse != null) {
                    closeableHttpResponse.close();
                }
                httpClient.close();
            }
            return upmsResult;
        }
    }
}
