package net.ourams.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.ourams.interceptor.Auth;
import net.ourams.service.CourseAssignmentService;
import net.ourams.vo.AssignmentVo;

@Controller
@RequestMapping(value = "/{coursePath}/assignment")
public class CourseAssignmentController {

	@Autowired
	private CourseAssignmentService assignmentService;
	
	@Auth
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String AssignmentList(@PathVariable("coursePath") String coursePath,
			 Model model) {
		System.out.println("AssignmentList 실행");
		
		int courseNo = 1;
		List<AssignmentVo> assignmentList = assignmentService.getList(courseNo);
		System.out.println(assignmentList.toString());
		
		model.addAttribute("coursePath", coursePath);
		model.addAttribute("assignmentList", assignmentList);
		
		return "course/assignment/assignment-list";
	}
	
	@Auth
	@RequestMapping(value = "/enroll", method = RequestMethod.GET)
	public String AssignmentEnroll(@PathVariable("coursePath") String coursePath,
			 Model model) {
		
		model.addAttribute("coursePath", coursePath);
		return "course/assignment/assignment-enroll";
	}
}
