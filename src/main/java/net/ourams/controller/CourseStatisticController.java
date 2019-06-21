package net.ourams.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.ourams.interceptor.Auth;
import net.ourams.interceptor.AuthUser;
import net.ourams.service.CourseStatisticService;
import net.ourams.util.JSONResult;
import net.ourams.vo.CourseVo;
import net.ourams.vo.UserVo;

@Controller
@RequestMapping(value = "/{coursePath}")
public class CourseStatisticController {

	@Autowired
	private CourseStatisticService statisticService;
	
	@Auth
	@RequestMapping(value = "/statistic", method = RequestMethod.GET)
	public String statisticsMain(@PathVariable("coursePath") String coursePath, @AuthUser UserVo authUser,
			Model model) {
		System.out.println("statisticMain 실행");

		Map<String, Object> map = statisticService.getUserList(coursePath);

		if (authUser.getUserType() == 1) {
			model.addAttribute("coursePath", coursePath);
			model.addAttribute("authUser", authUser);
			model.addAttribute("courseVo", map.get("courseVo"));
			model.addAttribute("userList", map.get("userList"));

			return "course/statistic";
		} else {
			return "course/page-404";
		}
	}
	
	@Auth
	@ResponseBody
	@RequestMapping(value = "/statistic/main", method = RequestMethod.POST)
	public JSONResult statisitcMain(@PathVariable("coursePath") String coursePath,
			@RequestBody CourseVo courseVo) {
		System.out.println("statisitcMain 실행");
		System.out.println(courseVo.getCourseNo());

		Map<String, Object> map = statisticService.getMain(courseVo.getCourseNo());
		
		JSONResult jsonResult;
		if (map != null) {
			jsonResult = JSONResult.success(map);
		} else {
			jsonResult = JSONResult.error(null);
		}

		return jsonResult;
	}
	
	@Auth
	@ResponseBody
	@RequestMapping(value = "/statistic/student", method = RequestMethod.POST)
	public JSONResult statisitcStudent(@PathVariable("coursePath") String coursePath,
			@RequestBody UserVo userVo) {
		System.out.println("statisitcStudent 실행");

		Map<String, Object> map = statisticService.getStudentStatistic(coursePath, userVo.getUserNo());
		
		JSONResult jsonResult;
		if (map != null) {
			jsonResult = JSONResult.success(map);
		} else {
			jsonResult = JSONResult.error(null);
		}

		return jsonResult;
	}
}
