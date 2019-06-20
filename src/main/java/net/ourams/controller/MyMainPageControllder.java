package net.ourams.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.ourams.interceptor.Auth;
import net.ourams.interceptor.AuthUser;
import net.ourams.service.MyMainPageService;
import net.ourams.vo.MyPageVo;
import net.ourams.vo.PostVo;
import net.ourams.vo.UserVo;


@Controller
@RequestMapping(value = "/myPage")
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
	
	@ResponseBody
	@RequestMapping(value = "/courseList", method = RequestMethod.POST)
	public List<MyPageVo> courseList(@Param("userNo") int userNo){
		System.out.println("courseList start");
		MyPageVo vo = new MyPageVo();
		vo.setUserNo(userNo);
		List<MyPageVo> list = myMainPageService.courseList(vo);
		
		System.out.println(list.toString());
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectNotice", method = RequestMethod.POST)
	public List<PostVo> selectNotice(@Param("userNo") int userNo){
		System.out.println("selectNotice start");
		PostVo vo = new PostVo();
		vo.setUserNo(userNo);
		List<PostVo> list = myMainPageService.selectNotice(vo);
		
		System.out.println(list.toString());
		return list;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/selectQna", method = RequestMethod.POST)
	public List<PostVo> selectQna(@Param("userNo") int userNo){
		System.out.println("selectQna start");
		PostVo vo = new PostVo();
		vo.setUserNo(userNo);
		List<PostVo> list = myMainPageService.selectQna(vo);
		
		System.out.println(list.toString());
		return list;
	}
	
	
	

	@RequestMapping(value = "/editForm")
	public String editForm() {
		System.out.println("start main");
		
		return "main/editForm";
	}
	
	
}
