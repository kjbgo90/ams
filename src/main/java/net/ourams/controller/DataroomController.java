package net.ourams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dataroom")
public class DataroomController {

	
	
	@RequestMapping("/form")
	public String dataroomForm() {
		return "course/course-dataroom";
	}
}
