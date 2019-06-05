package net.ourams.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.ourams.service.CourseDataroomService;

@Controller
@RequestMapping("/dataroom")
public class CourseDataroomController {

	@Autowired
	private CourseDataroomService CourseDataroomService;
	
	@RequestMapping("/form")
	public String dataroomForm() {
		return "course/course-dataroom";
	}
}
