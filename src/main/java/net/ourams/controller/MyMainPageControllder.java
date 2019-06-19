package net.ourams.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.ourams.interceptor.Auth;
import net.ourams.interceptor.AuthUser;
import net.ourams.service.MyMainPageService;
import net.ourams.vo.MyPageVo;
import net.ourams.vo.UserVo;


@Controller
@RequestMapping(value = "/main")
public class MyMainPageControllder {

	@Autowired
	private MyMainPageService myMainPageService;
	
	@RequestMapping(value = "/index")
	public String mainPage(
			Model model) {
		System.out.println("start main");
		
		return "main/myPage";
	}
	

	@Auth
	@RequestMapping(value = "/indexforstudent")
	public String indexforstudent( @AuthUser UserVo authUser,
			Model model) {
		System.out.println("start main for student");
		model.addAttribute("authUser", authUser);
		
		return "main/mypageForStudent";
	}
	
	@RequestMapping(value = "/courseList")
	public List<MyPageVo> courseList(@Param("userNo") int userNo){
		MyPageVo vo = new MyPageVo();
		vo.setUserNo(userNo);
		List<MyPageVo> list = myMainPageService.courseList(vo);
		
		return list;
	}
	

	@RequestMapping(value = "/editForm")
	public String editForm() {
		System.out.println("start main");
		
		return "main/editForm";
	}
	
	
}
