package net.ourams.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.ourams.vo.UserVo;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//1. handler 종류 확인
		if(handler instanceof HandlerMethod == false) {
			//controller에 있는 메소드 인지 확인 
			return true;
		}
		
        //2. @Auth 가 있는지?
		Auth auth = ((HandlerMethod) handler).getMethodAnnotation(Auth.class);
		if(auth == null) {
			//@Auth없음
			return true;
		}
		
        //3. @Auth 가 있으면  session 있는지 체크
		HttpSession session = request.getSession();
		if(session == null) {
			String oldUrl = request.getRequestURL().toString();

			
			//세션이 없으면 로그인 폼으로 리다이렉트, @Auth있고 세션 없는 경우 
			//ams가 앞에 붙으면 4번 없으면 3번을 쓰면 됨
			response.sendRedirect(request.getContextPath() + "/user/loginform?coursePath=" + oldUrl.split("/")[4]);
			return false;
		}
		
        //4. @Auth 가 있고 session 이 있고 session에 정보가 있는지?
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		if(authUser == null) {
			String oldUrl = request.getRequestURL().toString();

			//세션은 있는데 autUser가 없는 경우
			//ams가 앞에 붙으면 4번 없으면 3번을 쓰면 됨
			response.sendRedirect(request.getContextPath() + "/user/loginform?coursePath=" + oldUrl.split("/")[4]);
			return false;
		}
		
        //5. 모든 조건을 만족한 사용자는 요청한 곳으로 보낸다.
		return true;
	}

}
