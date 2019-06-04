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
import net.ourams.service.CourseAssignmentService;
import net.ourams.vo.UserVo;

@Controller
@RequestMapping(value = "/{coursePath}/assignment")
public class CourseAssignmentController {

	@Autowired
	private CourseAssignmentService assignmentService;
	
	/* 과제 게시판 메인 화면(전체 리스트 출력) */
	@Auth
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String AssignmentList(@PathVariable("coursePath") String coursePath, @AuthUser UserVo authUser,
			 Model model) {
		System.out.println("AssignmentList 실행");
		
		Map<String, Object> map = assignmentService.getList(coursePath);
		System.out.println(map.get("assignmentList"));
		System.out.println(map.get("subjectList"));
		
		model.addAttribute("coursePath", coursePath);
		model.addAttribute("assignmentList", map.get("assignmentList"));
		model.addAttribute("subjectList", map.get("subjectList"));
		
		return "course/assignment/assignment-list";
	}
	
	/* 과제 등록 페이지 */
	@Auth
	@RequestMapping(value = "/enroll", method = RequestMethod.GET)
	public String AssignmentEnroll(@PathVariable("coursePath") String coursePath, @AuthUser UserVo authUser,
			 Model model) {
		System.out.println("AssignmentEnroll 실행");
		
		model.addAttribute("coursePath", coursePath);
		return "course/assignment/assignment-enroll";
	}
}
