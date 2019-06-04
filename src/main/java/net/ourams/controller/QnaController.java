package net.ourams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class QnaController {

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
	
}
