package net.ourams.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.ourams.interceptor.Auth;
import net.ourams.interceptor.AuthUser;
import net.ourams.service.CourseQnaService;
import net.ourams.service.UserService;
import net.ourams.vo.PostVo;
import net.ourams.vo.UserVo;

@Controller
@RequestMapping(value="/{coursePath}/qna")
public class QnaController {
	
	@Autowired
	private CourseQnaService courseQnaService;
	
	@Autowired
	private UserService userService;

	/* 리스트 기본 */
	@Auth
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String qnaList(@PathVariable("coursePath") String coursePath, @AuthUser UserVo authUser, Model model) {
		System.out.println("list");
		int courseNo=1;
		List<PostVo> qnaList  = courseQnaService.getList(courseNo);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("coursePath",coursePath);
		return "course/qna/qna-list";
	}
	
	@Auth
	@RequestMapping(value = "/read/{postNo}", method = RequestMethod.GET)
	public String qnaRead(@PathVariable("coursePath") String coursePath, @AuthUser UserVo authUser,
						  @PathVariable("postNo") int postNo, Model model) {
		System.out.println("read");
		PostVo postVo = courseQnaService.read(postNo);
		UserVo writerVo = userService.read(postVo.getUserNo());
		model.addAttribute("PostVo", postVo);
		model.addAttribute("WriterVo", writerVo);
		System.out.println(postVo.getCategory());
		System.out.println(postVo);
		model.addAttribute("UserVo", authUser);
		model.addAttribute("coursePath", coursePath);

		
		return "course/qna/qna-read";
	}
	
	/* 글쓰기폼 */
	@Auth
	@RequestMapping(value = "/writeform", method = RequestMethod.GET)
	public String qnaWrite(@PathVariable("coursePath") String coursePath, Model model, HttpServletRequest re) {
		System.out.println("writeform");
		
		model.addAttribute("coursePath", coursePath);
		return "course/qna/qna-write";
	}
	
	/* 글저장 */
	@Auth
	@ResponseBody
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(@PathVariable("coursePath") String coursePath, @AuthUser UserVo authUser,
			@ModelAttribute PostVo postVo, HttpSession session, @RequestBody PostVo resJSON, HttpServletRequest re) {
		System.out.println("###write###");

		System.out.println(resJSON.getPostTitle());
		postVo.setUserNo(authUser.getUserNo());
		postVo.setPostContent(resJSON.getPostContent());
		postVo.setPostTitle(resJSON.getPostTitle());
		/* postVo.setCategory(resJSON.getCategory()); */
		postVo.setRegDate(resJSON.getRegDate());
		postVo.setUserName(authUser.getUserName());
		courseQnaService.write(postVo);
		System.out.println(coursePath);

		return coursePath;
	}

	
	
	
	
	
}
