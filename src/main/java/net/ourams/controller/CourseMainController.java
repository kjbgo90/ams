package net.ourams.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.ourams.interceptor.Auth;
import net.ourams.interceptor.AuthUser;
import net.ourams.service.CourseMainService;
import net.ourams.vo.UserVo;

@Controller
@RequestMapping(value = "/{coursePath}")
public class CourseMainController {
	
	@Autowired
	private CourseMainService courseMService;

	@Auth
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String courseMain(@PathVariable("coursePath") String coursePath,
							 Model model) {
		model.addAttribute("coursePath", coursePath);
		
		return "course/course-main";
	}
	
	@RequestMapping(value = "/404page", method = RequestMethod.GET)
	public String courseError() {
		return "course/page-404";
	}
	
	@Auth
	@RequestMapping(value = "/management", method = RequestMethod.GET)
	public String courseTeacherManage(@PathVariable("coursePath") String coursePath,
							 		  Model model,
							 		  @AuthUser UserVo authUser) {
		model.addAttribute("coursePath", coursePath);
		
		//로그인 한 유저의 타입이 강사가 아니면 에러페이지로 이동시킴
		if(authUser.getUserType() != 1) {
			return "course/page-404";
		}
		
		Map<String, Object> map = courseMService.getSubjectListAndLastChapterList(coursePath);
		model.addAttribute("SCListMap", map);
		
		return "course/add-object-page";
	}
}
