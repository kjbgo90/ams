package net.ourams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.ourams.interceptor.Auth;

@Controller
@RequestMapping(value = "/{coursePath}")
public class CourseMainController {

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
}
