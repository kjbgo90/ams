package net.ourams.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.ourams.service.CourseScheduleService;
import net.ourams.vo.UserVo;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	@Autowired
	private CourseScheduleService service;
	
	@RequestMapping("/form")
	public String scheduleForm() {
		System.out.println("schedule page");
		
		return "course/schedule";
	}
	
	@ResponseBody
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public List<UserVo> searchUsers(String value) throws UnsupportedEncodingException {
		System.out.println("search users...");
		String name = URLDecoder.decode(value, "UTF-8");
		System.out.println("params: " + name);
		
		List<UserVo> list = service.searchUsers(name);
		
		System.out.println(list.toArray());
		return list;
	}
}
