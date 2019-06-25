package net.ourams.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.ourams.interceptor.Auth;
import net.ourams.interceptor.AuthUser;
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
	public Map<String, Object> getCourseList(@RequestParam("userNo") int userNo,
											 @RequestParam("userType") int userType) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		List<CourseVo> courseList = null;
		
		if(userType == 1 || userType == 2) {
			courseList = courseMService.getCourseList(userNo);
		}
		else {
			courseList = courseMService.getCourseList(userNo, userType);
		}
		
		map.put("courseList", courseList);
		
		//매니저로 접속했을 경우에만 학생리스트와 강사리스트를 가져온다.
		if(userType == 0) {
			List<UserVo> studentList = courseMService.getAllStudentList();
			List<UserVo> teacherList = courseMService.getAllTeacherList();
			map.put("studentList", studentList);
			map.put("teacherList", teacherList);
		}
		
		return map;
	}
	
	@Auth
	@RequestMapping(value="/course/create", method = RequestMethod.POST)
	public String createCourse(@AuthUser UserVo authUser,
							   @RequestParam("courseName") String courseName,
							   @RequestParam("lecRoomNo") int lecRoomNo,
							   @RequestParam("startDate") String startDate,
							   @RequestParam("endDate") String endDate,
							   @RequestParam("teacherNo") int teacherNo,
							   @RequestParam("coursePath") String coursePath,
							   @RequestParam("userNoList") List<Integer> userNoList) {
		
		CourseVo createCourseVo = new CourseVo();
		
		createCourseVo.setCourseName(courseName);
		createCourseVo.setLecRoomNo(lecRoomNo);
		createCourseVo.setStartDate(startDate);
		createCourseVo.setEndDate(endDate);
		createCourseVo.setTeacherNo(teacherNo);
		createCourseVo.setCoursePath(coursePath);
		createCourseVo.setManagerNo(authUser.getUserNo());
		
		courseMService.insertCourseByCourseVoAndRegistCourseAndInsertDataRoom(createCourseVo, userNoList);
		
		return "redirect:/index";
	}
}
