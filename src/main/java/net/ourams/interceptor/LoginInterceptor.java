package net.ourams.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.ourams.service.UserService;
import net.ourams.vo.UserVo;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Autowired
	private UserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("LoginInterceptor()");
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String url = request.getParameter("url");
		
		UserVo userVo = userService.login(email, password);
		
		if(userVo == null) {
			response.sendRedirect(request.getContextPath() + "/user/loginform?result=fail&url=" + url);
			return false;
		}
		HttpSession session = request.getSession();
		session.setAttribute("authUser", userVo);
		response.sendRedirect(url);
		
		return false;
	}

	
}
