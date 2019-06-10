package net.ourams.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import net.ourams.service.PostService;
import net.ourams.service.UserService;
import net.ourams.vo.PostVo;
import net.ourams.vo.UserVo;

@Controller
@RequestMapping(value="/{coursePath}/notice")
public class NoticeController {
	
	@Autowired
	private PostService postService;
	@Autowired
	private UserService userService;
	
	
	@Auth
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String noticeList(@PathVariable("coursePath") String coursePath, @AuthUser UserVo authUser, Model model) {
		System.out.println("list");
		int courseNo=1;
		List<PostVo> noticeList  = postService.getList(courseNo);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("coursePath",coursePath);
		
		return "course/notice/notice-list";
	}
	
	
	
	
	
	@Auth
	@RequestMapping(value = "/read/{postNo}", method = RequestMethod.GET)
	public String noticeRead(@PathVariable("coursePath") String coursePath, @AuthUser UserVo authUser,
							@PathVariable("postNo") int postNo, Model model) {
		System.out.println("read");
		PostVo postVo = postService.read(postNo);
		UserVo writerVo = userService.read(postVo.getUserNo());
		model.addAttribute("PostVo", postVo);
		model.addAttribute("WriterVo", writerVo);

		System.out.println(postVo);
		model.addAttribute("UserVo", authUser);

		model.addAttribute("coursePath",coursePath);
		
		return "course/notice/notice-read";
	}
	
	@Auth
	@ResponseBody
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(@PathVariable("coursePath") String coursePath, @AuthUser UserVo authUser,
						@ModelAttribute PostVo postVo, HttpSession session,
						@RequestBody PostVo resJSON,
						HttpServletRequest re) {
		//UserVo userVo = (UserVo)session.getAttribute("authUser");
		//model.addAttribute("userVo", userVo);
		System.out.println("###write###");
		System.out.println("###test### 10");
		
		System.out.println(resJSON.getPostTitle());
		postVo.setUserNo(authUser.getUserNo());
		postVo.setPostContent(resJSON.getPostContent());
		postVo.setPostTitle(resJSON.getPostTitle());
		postVo.setCategory(resJSON.getCategory());
		postVo.setRegDate(resJSON.getRegDate());
		postVo.setUserName(authUser.getUserName());
		postService.write(postVo);		
		System.out.println(coursePath);
		
		return coursePath ;
	}
	
	

	
	@Auth
	@RequestMapping(value = "/writeform", method=RequestMethod.GET)
	public String noticeWrite(@PathVariable("coursePath") String coursePath, Model model, HttpServletRequest re) {
		System.out.println("writeform 3");
		/*
		 * System.out.println(re.toString()); System.out.println(re.getRequestURI());
		 * System.out.println(re.getRequestURL());
		 */
		
		model.addAttribute("coursePath", coursePath);
		return "course/notice/notice-write";
	}
}


