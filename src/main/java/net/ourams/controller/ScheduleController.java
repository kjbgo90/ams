package net.ourams.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.ourams.interceptor.Auth;
import net.ourams.interceptor.AuthUser;
import net.ourams.service.CourseScheduleService;
import net.ourams.vo.CourseScheduleVo;
import net.ourams.vo.UserVo;

@Controller
@RequestMapping("/{coursePath}/schedule")
public class ScheduleController {
	
	@Autowired
	private CourseScheduleService service;
	
	@Autowired
	private JavaMailSender mailSender;
	 
	
	//schedule main form
	@Auth
	@RequestMapping("/form")
	public String scheduleForm(@PathVariable("coursePath") String coursePath, Model model, 
								@AuthUser UserVo authUser) {
		System.out.println("schedule page");
		
		model.addAttribute("coursePath", coursePath);
		model.addAttribute("authUser", authUser);
		return "course/schedule";
	}
	
	//for Autocomplete
	@ResponseBody
	@RequestMapping(value="/autocomplete", method=RequestMethod.POST)
	public List<UserVo> searchUsers(String value) throws UnsupportedEncodingException {
		System.out.println("search users...");
		String name = URLDecoder.decode(value, "UTF-8");
		System.out.println("params: " + name);
		
		List<UserVo> list = service.searchUsers(name);
		
		return list;
	}
	
	//search all users
	@ResponseBody
	@RequestMapping(value="/searchUser", method=RequestMethod.POST)
	public List<UserVo> searchUserAll(){
		System.out.println("search users All...");
			
		List<UserVo> list = service.searchUserAll();
			
		return list;
	}
	
	//load schedule
	@ResponseBody
	@RequestMapping(value="/load", method=RequestMethod.POST)
	public List<CourseScheduleVo> loadSchedule(@PathVariable("coursePath") String coursePath, @AuthUser UserVo authUser){
		System.out.println("login User: " + authUser.getUserName());
		System.out.println("load "+ coursePath +" schedule...");
		
		List<CourseScheduleVo> list = service.loadSchedule(coursePath, authUser);
		
		return list;
	}
	
	//load today schedule (@Pathvariable: get from URL, @RequestParam: get from parameter after URL)
	@ResponseBody
	@RequestMapping(value="/today", method=RequestMethod.POST)
	public List<CourseScheduleVo> loadTodaySchedule(@PathVariable("coursePath") String coursePath, @RequestParam("today") String today){
		System.out.println(today + " event");
		
		List<CourseScheduleVo> list = service.loadTodaySchedule(coursePath, today);

		return list;
	}
	
	//load tag case by schedule
	@ResponseBody
	@RequestMapping(value="/loadTag", method=RequestMethod.POST)
	public List<String> loadTag(@RequestBody CourseScheduleVo vo){
		System.out.println("load tag on schedule No" + vo.getScheduleNo());
		
		return service.loadTag(vo.getScheduleNo());
	}
	
	//insert schedule
	@ResponseBody
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public int registerSchedule(@RequestBody List<Object> multiParam, @AuthUser UserVo authUser,
								@PathVariable("coursePath") String coursePath) {
		System.out.println("register users...");
		System.out.println(multiParam);
		
		return service.registerSchedule(multiParam, authUser, coursePath);
	}
	
	//selected schedule 
	@ResponseBody
	@RequestMapping(value="/selected", method=RequestMethod.POST)
	public Map<String, Object> selectedSchedule(@RequestBody CourseScheduleVo vo) {
		System.out.println("selected NO " + vo.getScheduleNo() + " schedule info...");
		
		Map<String, Object> result = service.selectedSchedule(vo);
		
		return result;
	}
	
	//search schedule
	@ResponseBody
	@RequestMapping(value="/searchSchedule")
	public List<CourseScheduleVo> searchSchedule(@RequestBody CourseScheduleVo vo){
		System.out.println("searching schedule named " + vo.getScheduleName() + "...");
		
		return service.searchSchedule(vo);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public void modifySchedule(@RequestBody List<Object> multiParam){
		System.out.println("modify: " + multiParam);
		
		service.modifySchedule(multiParam);
	}
	
	@ResponseBody 
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public int deleteSchedule(@RequestBody CourseScheduleVo vo) {
		System.out.println("delete schdule NO " + vo.getScheduleNo() + "...");

		return service.deleteSchedule(vo);
	}

	// mailSending 코드
	
	@RequestMapping(value = "/alarm", method=RequestMethod.POST)
	public void mailSending(HttpServletRequest request) {

		String setfrom = "rnalstn0507@gmail.com";
		/*
		 * String tomail = request.getParameter("tomail"); // 받는 사람 이메일 String title =
		 * request.getParameter("[Academy Management Service]"); // 제목 String content =
		 * request.getParameter("새로운 이벤트가 등록 되었습니다."); // 내용
		 */

		String tomail = "rnalstn0507@gmail.com";
		String title = "[Academy Management Service]";
		String content = "새로운 이벤트가 등록 되었습니다.";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
