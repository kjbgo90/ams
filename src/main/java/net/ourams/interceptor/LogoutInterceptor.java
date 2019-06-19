package net.ourams.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LogoutInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("LogoutInterceptor()");
		
		HttpSession session = request.getSession();
		String url = "/ams/index";
		
		session.removeAttribute("authUser");
		session.invalidate();
		
		response.sendRedirect(url);
		return false;
	}

}
