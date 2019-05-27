package com.zheng.common.util;

import com.alibaba.fastjson.JSON;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * request工具类
 * Created by ZhangShuzheng on 2016/12/12.
 */
public class RequestUtil {

	private static final Logger LOGGER = LoggerFactory.getLogger(RequestUtil.class);
	/**
	 * 移除request指定参数
	 * @param request
	 * @param paramName
	 * @return
	 */
	public String removeParam(HttpServletRequest request, String paramName) {
		String queryString = "";
		Enumeration keys = request.getParameterNames();
		while (keys.hasMoreElements()) {
			String key = (String) keys.nextElement();
			if (key.equals(paramName)) {
				continue;
			}
			if ("".equals(queryString)) {
				queryString = key + "=" + request.getParameter(key);
			} else {
				queryString += "&" + key + "=" + request.getParameter(key);
			}
		}
		return queryString;
	}

	/**
	 * 获取请求basePath
	 * @param request
	 * @return
	 */
	public static String getBasePath(HttpServletRequest request) {
		StringBuffer basePath = new StringBuffer();
		String scheme = request.getScheme();
		String domain = request.getServerName();
		int port = request.getServerPort();
		basePath.append(scheme);
		basePath.append("://");
		basePath.append(domain);
		if("http".equalsIgnoreCase(scheme) && 80 != port) {
			basePath.append(":").append(String.valueOf(port));
		} else if("https".equalsIgnoreCase(scheme) && port != 443) {
			basePath.append(":").append(String.valueOf(port));
		}
		return basePath.toString();
	}

	/**
	 * 获取ip工具类，除了getRemoteAddr，其他ip均可伪造
	 * @param request
	 * @return
	 */
	public static String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("Cdn-Src-Ip");    // 网宿cdn的真实ip
		if (ip == null || ip.length() == 0 || " unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");   // 蓝讯cdn的真实ip
		}
		if (ip == null || ip.length() == 0 || " unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-Forwarded-For");  // 获取代理ip
		}
		if (ip == null || ip.length() == 0 || " unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP"); // 获取代理ip
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP"); // 获取代理ip
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr(); // 获取真实ip
		}
		return ip;
	}

	/**
	 * 请求中参数转Map<String, String>,for支付宝异步回调,平时建议直接使用request.getParameterMap(),返回Map<String, String[]>
	 * @param request
	 * @return
	 */
	public static Map<String, String> getParameterMap(HttpServletRequest request) {
		Map<String, String> result = new HashMap<>();
		Enumeration parameterNames = request.getParameterNames();
		while (parameterNames.hasMoreElements()) {
			String parameterName = (String) parameterNames.nextElement();
			result.put(parameterName, request.getParameter(parameterName));
		}
		return result;
	}


	/**
	 * 从request中读取请求参数Map（GET的或POST的）
	 * @param request
	 * @return
	 */
	public static Map<String, String> getParameterMapFromRequest(HttpServletRequest request) {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			Map<String, String> paramMap = new HashMap<>();
			Enumeration parameterNames = request.getParameterNames();
			while (parameterNames.hasMoreElements()) {
				String parameterName = (String) parameterNames.nextElement();
				paramMap.put(parameterName, request.getParameter(parameterName));
			}
			return paramMap;
		} else if (request.getMethod().equalsIgnoreCase("POST")) {
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
		}
		return null;
	}

	/**
	 * 从request读取指定参数名的参数值（GET的或POST的）
	 * @param request
	 * @param paramName
	 * @return
	 */
	public static String getParameterFromRequest(HttpServletRequest request, String paramName) {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			return request.getParameter(paramName);
		} else if (request.getMethod().equalsIgnoreCase("POST")) {
			Map<String, String> params = getParameterMapFromRequest(request);
			return (params != null && params.containsKey(paramName)) ? String.valueOf(params.get(paramName)) : null;
		}
		return null;
	}

	/**
	 * 因为用流的方式读取POST参数只能读取一次，所以这里把参数提取出来放在request的一个attribute属性中，这样就可以重复读取了
	 * @param request
	 * @return
	 */
	public static HttpServletRequest extractParam(HttpServletRequest request) {
		Map<String, String> paramMap = getParameterMapFromRequest(request);
		HttpServletRequest request1 = request;
		request1.setAttribute("paramMap", paramMap);
		return request1;
	}

	/**
	 * 从request读取参数Map
	 * @param request 该request是经过提取参数的了
	 * @return
	 */
	public static Map<String, String> getExtractedParamMapFromRequest(HttpServletRequest request) {
		return (Map<String, String>)request.getAttribute("paramMap");
	}

	/**
	 * 从request读取指定参数名的参数值（GET的或POST的），该request已经经过提取参数map了，从attribute中读取POST参数值
	 * @param request
	 * @param paramName
	 * @return
	 */
	public static String getExtractedParamFromRequest(HttpServletRequest request, String paramName) {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			return request.getParameter(paramName);
		} else if (request.getMethod().equalsIgnoreCase("POST")) {
			Map<String, String> params = getExtractedParamMapFromRequest(request);
			return (params != null && params.containsKey(paramName)) ? String.valueOf(params.get(paramName)) : null;
		}
		return null;
	}
}
