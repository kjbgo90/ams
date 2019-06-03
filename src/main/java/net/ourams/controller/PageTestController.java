package net.ourams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PageTestController {
	
	@RequestMapping(value = "/course/main", method = RequestMethod.GET)
	public String courseMain() {
		return "course/course-main";
	}

	@RequestMapping(value = "/course/notice/list", method = RequestMethod.GET)
	public String noticeList() {
		return "course/notice/notice-list";
	}
	
	@RequestMapping(value = "/course/notice/read", method = RequestMethod.GET)
	public String noticeRead() {
		return "course/notice/notice-read";
	}
	
	@RequestMapping(value = "/course/notice/write", method = RequestMethod.GET)
	public String noticeWrite() {
		return "course/notice/notice-write";
	}
	
	@RequestMapping(value = "/course/qna/list", method = RequestMethod.GET)
	public String qnaList() {
		return "course/qna/qna-list";
	}
	
	@RequestMapping(value = "/course/qna/read", method = RequestMethod.GET)
	public String qnaRead() {
		return "course/qna/qna-read";
	}
	
	@RequestMapping(value = "/course/qna/write", method = RequestMethod.GET)
	public String qnaWrite() {
		return "course/qna/qna-write";
	}
	
	@RequestMapping(value = "/course/aop", method = RequestMethod.GET)
	public String courseAop() {
		return "course/add-object-page";
	}
	
	@RequestMapping(value = "/course/dataroom", method = RequestMethod.GET)
	public String courseDataRoom() {
		return "course/course-dataroom";
	}
	
	@RequestMapping(value = "/course/assignment/list", method = RequestMethod.GET)
	public String courseAssignmentList() {
		return "course/assignment/assignment-list";
	}
	
	@RequestMapping(value = "/course/assignment/enroll", method = RequestMethod.GET)
	public String courseAssignmentEnroll() {
		return "course/assignment/assignment-enroll";
	}
}
