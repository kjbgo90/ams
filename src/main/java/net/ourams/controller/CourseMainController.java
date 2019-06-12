package net.ourams.controller;

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
import net.ourams.service.CourseMainService;
import net.ourams.vo.ChapterVo;
import net.ourams.vo.CourseVo;
import net.ourams.vo.SubjectVo;
import net.ourams.vo.UserVo;

@Controller
@RequestMapping(value = "/{coursePath}")
public class CourseMainController {
	
	@Autowired
	private CourseMainService courseMService;

	@Auth
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String courseMain(@PathVariable("coursePath") String coursePath,
							 Model model) {		
		CourseVo courseVo = courseMService.getCourseVo(coursePath);
		
		model.addAttribute("coursePath", coursePath);
		model.addAttribute("courseVo", courseVo);
		
		return "course/course-main";
	}
	
	@Auth
	@ResponseBody
	@RequestMapping(value = "/main/loadpage", method = RequestMethod.POST)
	public Map<String, Object> userListCall(@PathVariable("coursePath") String coursePath){
		return courseMService.getUserList(coursePath);
	}
	
	@Auth
	@RequestMapping(value = "/main/seatdecide", method = RequestMethod.POST)
	public String seatDecide(@PathVariable("coursePath") String coursePath,
							 @RequestParam("seatNo") int seatNo,
							 @AuthUser UserVo authUser) {
		
		courseMService.seatDecide(coursePath, seatNo, authUser);
		
		return "redirect:/" + coursePath + "/main";
	}
	
	@Auth
	@ResponseBody
	@RequestMapping(value = "/main/userinfo", method = RequestMethod.POST)
	public UserVo userInfo(@RequestParam("userNo") int userNo) {
		return courseMService.getUserInfo(userNo);
	}
	
	@RequestMapping(value = "/404page", method = RequestMethod.GET)
	public String courseError() {
		return "course/page-404";
	}
	
	@Auth
	@RequestMapping(value = "/management", method = RequestMethod.GET)
	public String courseTeacherManage(@PathVariable("coursePath") String coursePath,
							 		  Model model,
							 		  @AuthUser UserVo authUser) {
		model.addAttribute("coursePath", coursePath);
		
		//로그인 한 유저의 타입이 강사가 아니면 에러페이지로 이동시킴
		if(authUser.getUserType() != 1) {
			return "course/page-404";
		}
		
		Map<String, Object> map = courseMService.getSubjectListAndLastChapterList(coursePath);
		model.addAttribute("SCListMap", map);
		
		return "course/add-object-page";
	}
	
	@Auth
	@ResponseBody
	@RequestMapping(value = "/management/chapter/edit", method = RequestMethod.POST)
	public ChapterVo courseManageChapterEdit(@RequestParam("chapterNo") int chapterNo,
									  		 @RequestParam("chapterContent") String chapterContent) {
		System.out.println(chapterNo + " " + chapterContent);
		
		
		ChapterVo chapterVo = courseMService.chapterEdit(chapterNo, chapterContent);
		return chapterVo;
	}
	
	@Auth
	@ResponseBody
	@RequestMapping(value = "/management/subject/edit", method = RequestMethod.POST)
	public SubjectVo courseManageSubjectEdit(@RequestBody SubjectVo subjectVo ) {
		System.out.println(subjectVo.toString());
		
		SubjectVo editSubVo = courseMService.subjectEdit(subjectVo);
		
		return editSubVo;
	}
	
	@Auth
	@RequestMapping(value = "/management/subject/write", method = RequestMethod.POST)
	public String courseManageSubjectWrite(@PathVariable("coursePath") String coursePath,
										   @RequestParam("subjectTitle") String subjectTitle,
										   @RequestParam("startDate") String startDate,
										   @RequestParam("endDate") String endDate,
										   @RequestParam("scheduleMemo") String scheduleMemo,
										   @AuthUser UserVo authUser,
										   Model model) {
		model.addAttribute("coursePath", coursePath);
		
		SubjectVo inputSubjectVo = new SubjectVo();
		inputSubjectVo.setSubjectTitle(subjectTitle);
		inputSubjectVo.setStartDate(startDate);
		inputSubjectVo.setEndDate(endDate);
		inputSubjectVo.setUserNo(authUser.getUserNo());
		inputSubjectVo.setScheduleMemo(scheduleMemo);
		System.out.println(inputSubjectVo.toString());
		
		courseMService.writeSubjectAndSchedule(inputSubjectVo, coursePath);
		
		
		return "redirect:/" + coursePath + "/management";
	}
	
	@Auth
	@ResponseBody
	@RequestMapping(value = "/management/subject/pick", method = RequestMethod.POST)
	public Map<String, Object> courseSubjectPick(@RequestParam("subjectNo") int subjectNo){
		
		return courseMService.getSubjectAndChapterList(subjectNo);
	}
	
	@Auth
	@ResponseBody
	@RequestMapping(value = "/management/chapter/regist", method = RequestMethod.POST)
	public ChapterVo courseChapterRegist(@RequestParam("subjectNo") int subjectNo,
										 @RequestParam("chapterContent") String chapterContent) {
	
		ChapterVo inputChapterVo = new ChapterVo();
		inputChapterVo.setChapterContent(chapterContent);
		inputChapterVo.setSubjectNo(subjectNo);
		
		courseMService.chapterRegist(inputChapterVo);
		
		return inputChapterVo;
	}
	
	@Auth
	@RequestMapping(value = "/management/subject/delete", method = RequestMethod.POST)
	public String deleteSubjectAndScheduleAndChapter(@PathVariable("coursePath") String coursePath,
										   			 @RequestParam("delSubjectNo") int subjectNo,
										   			 @RequestParam("delScheduleNo") int scheduleNo) {
		System.out.println(subjectNo + " " + scheduleNo);
		
		courseMService.deleteSubjectAndSchedule(subjectNo, scheduleNo);
		
		return "redirect:/" + coursePath + "/management";
	}
	
	@Auth
	@ResponseBody
	@RequestMapping(value = "/management/chapter/delete", method = RequestMethod.POST)
	public int deleteChapter(@RequestParam("chapterNo") int chapterNo) {
		
		return courseMService.deleteChapter(chapterNo);
	}
}
