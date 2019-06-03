package net.ourams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.ourams.interceptor.Auth;

@Controller
@RequestMapping(value = "/{coursePath}")
public class CourseMainController {

	@Auth
	@RequestMapping(value = {"/main"}, method = RequestMethod.GET)
	public String courseMain(@PathVariable("coursePath") String coursePath) {
		
		return "course/course-main";
	}
}
