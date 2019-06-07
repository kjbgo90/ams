package net.ourams.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.ourams.service.CourseScheduleService;
import net.ourams.vo.CourseScheduleVo;
import net.ourams.vo.UserVo;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	@Autowired
	private CourseScheduleService service;
	
	//schedule main form
	@RequestMapping("/form")
	public String scheduleForm() {
		System.out.println("schedule page");
		
		return "course/schedule";
	}
	
	//schedule tag
	@ResponseBody
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public List<UserVo> searchUsers(String value) throws UnsupportedEncodingException {
		System.out.println("search users...");
		String name = URLDecoder.decode(value, "UTF-8");
		System.out.println("params: " + name);
		
		List<UserVo> list = service.searchUsers(name);
		
		return list;
	}
	
	//load schedule
	@ResponseBody
	@RequestMapping(value="/load", method=RequestMethod.POST)
	public List<CourseScheduleVo> loadSchedule(){
		System.out.println("load schedule...");
		
		List<CourseScheduleVo> list = service.loadSchedule();
		return list;
	}
	
	//insert schedule
	@ResponseBody
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public int registerSchedule(@RequestBody CourseScheduleVo vo) {
		System.out.println("register users...");
		System.out.println("params info: " + vo.toString());
		
		return service.registerSchedule(vo);
		
	}
}
