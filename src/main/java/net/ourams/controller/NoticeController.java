package net.ourams.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.ourams.interceptor.Auth;
import net.ourams.interceptor.AuthUser;
import net.ourams.service.PostService;
import net.ourams.vo.PostVo;
import net.ourams.vo.UserVo;

@Controller
@RequestMapping(value="/{coursePath}/notice")
public class NoticeController {
	
	@Autowired
	private PostService PostService;
	
	
	@Auth
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String noticeList(@PathVariable("coursePath") String coursePath, @AuthUser UserVo authUser, Model model) {
		
		int courseNo=1;
		List<PostVo> noticeList  = PostService.getList(courseNo);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("coursePath",coursePath);
		
		return "course/notice/notice-list";
	}
	
	
	
	
	
	@Auth
	@RequestMapping(value = "/read/{postNo}", method = RequestMethod.GET)
	public String noticeRead(@PathVariable("coursePath") String coursePath, @AuthUser UserVo authUser,
							@PathVariable("postNo") int postNo, Model model) {
		
		PostVo PostVo = PostService.read(postNo);
		model.addAttribute("PostVo", PostVo);
		model.addAttribute("coursePath",coursePath);
		
		return "course/notice/notice-read";
	}
	
	
	
	
	@Auth
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String noticeWrite() {
		return "course/notice/notice-write";
	}
	
}
