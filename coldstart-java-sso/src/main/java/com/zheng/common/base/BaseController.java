package com.zheng.common.base;

import com.zheng.common.util.PropertiesFileUtil;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.session.InvalidSessionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zheng.common.constant.*;

/**
 * 控制器基类
 * Created by ZhangShuzheng on 2017/2/4.
 */
public abstract class BaseController {

	private final static Logger LOGGER = LoggerFactory.getLogger(BaseController.class);

	/**
	 * 统一异常处理
	 * @param request
	 * @param response
	 * @param exception
	 */
	@ExceptionHandler
	public UpmsResult exceptionHandler(HttpServletRequest request, HttpServletResponse response, Exception exception) {
		LOGGER.error("统一异常处理：", exception);
		request.setAttribute("ex", exception);
		if (null != request.getHeader("X-Requested-With") && "XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With"))) {
			request.setAttribute("requestHeader", "ajax");
		}
		// shiro没有权限异常
		if (exception instanceof UnauthorizedException) {
			return new UpmsResult(UpmsResultConstant.NO_ACCESS_PERMISSION, "没有访问权限");
		}
		// shiro会话已过期异常
		if (exception instanceof InvalidSessionException) {
			return new UpmsResult(UpmsResultConstant.INVALID_SESSION, "会话过期");
		}
		return new UpmsResult(UpmsResultConstant.FAILED, exception.getMessage());
	}

	/**
	 * 返回jsp视图
	 * @param path
	 * @return
	 */
	public static String jsp(String path) {
		return path.concat(".jsp");
	}

	/**
	 * 返回thymeleaf视图
	 * @param path
	 * @return
	 */
	public static String thymeleaf(String path) {
		String folder = PropertiesFileUtil.getInstance().get("app.name");
		return "/".concat(folder).concat(path).concat(".html");
	}

}
