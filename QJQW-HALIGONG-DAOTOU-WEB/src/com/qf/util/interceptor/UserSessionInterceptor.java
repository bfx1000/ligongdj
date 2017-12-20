package com.qf.util.interceptor;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.qf.util.common.Const;

public class UserSessionInterceptor extends HandlerInterceptorAdapter {
	
   @Override  
    public void postHandle(HttpServletRequest request, HttpServletResponse response,  
            Object obj, ModelAndView mav) throws Exception {  
//	   response.sendRedirect(request.getContextPath() + "/login.jsp");
	   
	   String path = request.getServletPath();
		if(path.matches(Const.NO_INTERCEPTOR_PATH)){
//			return true;
		}else{
			HttpSession session = request.getSession();
			if(session.getAttribute("USER_ID")==null){//没有登录
				
//			response.sendRedirect(request.getContextPath() + "/index/eb61f5097ea96a579a0c470752ef9bbb");
			}
		}
	   
    }  
	   
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		System.out.println("session.getAttribute(USER_ID) == " +session.getAttribute("USER_ID"));
		if(session.getAttribute("USER_ID")==null){//没有登录
			//跳转登录页面
			return true;
		}
		return true;
	}
	
	
}
