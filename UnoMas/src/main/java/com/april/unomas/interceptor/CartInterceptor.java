package com.april.unomas.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class CartInterceptor implements HandlerInterceptor{

	// cart 작업 전 로그인이 안되어있으면 로그인화면으로 보내기
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception { 
		// 세션 가져오기
		HttpSession session = request.getSession();
		
		// 로그인이 안되어있다면
		if(session.getAttribute("saveID") == null) {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter printwriter = response.getWriter();
			printwriter.println("<script>alert('로그인이 필요합니다.'); location.href='/user/login';</script>");
			printwriter.flush();
			printwriter.close(); 
			
			return false;
		} else {
			return true;
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}


}
