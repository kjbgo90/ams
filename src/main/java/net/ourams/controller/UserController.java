package net.ourams.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.ourams.interceptor.Auth;
import net.ourams.service.CourseMainService;
import net.ourams.service.UserService;
import net.ourams.vo.CourseVo;
import net.ourams.vo.UserVo;

@Controller
public class UserController {
	
	@Autowired
	private CourseMainService courseMService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/user/loginform", method = RequestMethod.GET)
	public String loginForm() {
		return "user/login-form";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "main/index";
	}
	
	@RequestMapping(value = "/joinmember", method = RequestMethod.POST)
	public String joinMember(@RequestParam("email") String email,
							 @RequestParam("password") String password,
							 @RequestParam("userName") String userName,
							 @RequestParam("phoneNumber") String phoneNumber,
							 @RequestParam("gender") String gender) {
		
		int random = (int)(Math.random() * 5) + 1;
		UserVo joinUserVo = new UserVo();

		joinUserVo.setEmail(email);
		joinUserVo.setPassword(password);
		joinUserVo.setUserName(userName);
		if(gender.equals("man")) {
			joinUserVo.setLogoPath("/assets/img/profile-photos/" + random + ".png");
		} else {
			joinUserVo.setLogoPath("/assets/img/profile-photos/" + (random + 5) + ".png");
		}
		joinUserVo.setPhoneNumber(phoneNumber.substring(0, 3) + "-" + phoneNumber.substring(3, 7) + "-" + phoneNumber.substring(7));
		joinUserVo.setUserType(2);
		
		int result = userService.joinMemberByUserVo(joinUserVo);
		
		return "redirect:index?result=" + result;
	}
	
	@Auth
	@ResponseBody
	@RequestMapping(value = "/index/courselist", method = RequestMethod.POST)
	public List<CourseVo> getCourseList(@RequestParam("userNo") int userNo,
										@RequestParam("userType") int userType) {
		
		List<CourseVo> list = null;
		
		if(userType == 1 || userType == 2) {
			list = courseMService.getCourseList(userNo);
		}
		else {
			list = courseMService.getCourseList(userNo, userType);
		}
		
		return list;
	}
}
