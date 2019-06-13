package net.ourams.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public List<UserVo> searchUserAll(){
		System.out.println("search users All...");
			
		List<UserVo> list = service.searchUserAll();
			
		return list;
	}
	
	//load schedule
	@ResponseBody
	@RequestMapping(value="/load", method=RequestMethod.POST)
	public List<CourseScheduleVo> loadSchedule(@PathVariable("coursePath") String coursePath){
		System.out.println("load "+ coursePath +" schedule...");
		
		List<CourseScheduleVo> list = service.loadSchedule(coursePath);
		
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
	public int registerSchedule(@RequestBody List<Object> multiParam) {
		System.out.println("register users...");
		System.out.println(multiParam);
		
		return service.registerSchedule(multiParam);
	}
	
	//selected schedule 
	@ResponseBody
	@RequestMapping(value="/selected", method=RequestMethod.POST)
	public Map<String, Object> selectedSchedule(@RequestBody CourseScheduleVo vo) {
		System.out.println("selected NO " + vo.getScheduleNo() + " schedule info...");
		
		Map<String, Object> result = service.selectedSchedule(vo);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public int modifySchedule(@RequestBody CourseScheduleVo vo){
		
		return 0;
	}
	
	@ResponseBody 
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public int deleteSchedule(@RequestBody CourseScheduleVo vo) {
		System.out.println("delete schdule NO " + vo.getScheduleNo() + "...");
		
		return service.deleteSchedule(vo);
	}
	
	
}
