package net.ourams.controller;

import java.util.List;
import java.util.Map;

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
import net.ourams.service.CourseAssignmentService;
import net.ourams.util.JSONResult;
import net.ourams.vo.AssignmentVo;
import net.ourams.vo.ChapterVo;
import net.ourams.vo.SubjectVo;
import net.ourams.vo.SubmitVo;
import net.ourams.vo.UserVo;

@Controller
@RequestMapping(value = "/{coursePath}/assignment")
public class CourseAssignmentController {

	@Autowired
	private CourseAssignmentService assignmentService;

	/* 과제 게시판 메인 화면(전체 리스트 출력) */
	@Auth
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String assignmentList(@PathVariable("coursePath") String coursePath, @AuthUser UserVo authUser,
			Model model) {
		System.out.println("assignmentList 실행");

		Map<String, Object> map = assignmentService.getList(coursePath);
		System.out.println(map.get("assignmentList"));
		System.out.println(map.get("subjectList"));

		model.addAttribute("coursePath", coursePath);
		model.addAttribute("assignmentList", map.get("assignmentList"));
		model.addAttribute("subjectList", map.get("subjectList"));
		model.addAttribute("lastAssignment", map.get("lastAssignment"));
		model.addAttribute("authUser", authUser);
		model.addAttribute("submitList", map.get("submitList"));

		return "course/assignment/assignment-list";
	}

	/* 과제 등록 페이지 */
	@Auth
	@RequestMapping(value = "/enroll", method = RequestMethod.GET)
	public String assignmentEnroll(@PathVariable("coursePath") String coursePath, @AuthUser UserVo authUser,
			Model model) {
		System.out.println("assignmentEnroll 실행");

		Map<String, Object> map = assignmentService.getEnrollPage(coursePath);

		if (authUser.getUserType() == 1) {
			model.addAttribute("coursePath", coursePath);
			model.addAttribute("authUser", authUser);
			model.addAttribute("subjectList", map.get("subjectList"));

			return "course/assignment/assignment-enroll";
		} else {
			return "course/page-404";
		}
	}

	@Auth
	@ResponseBody
	@RequestMapping(value = "/submit", method = RequestMethod.POST)
	public JSONResult assignmentSubmit(@PathVariable("coursePath") String coursePath,
			@ModelAttribute SubmitVo submitVo) {
		System.out.println("assignmentSubmit 실행");
		System.out.println(submitVo.toString());

		submitVo = assignmentService.submit(submitVo);

		JSONResult jsonResult;
		if (submitVo.getSubmitNo() != 0) {
			jsonResult = JSONResult.success(submitVo);
		} else {
			jsonResult = JSONResult.error(null);
		}

		return jsonResult;
	}

	@Auth
	@ResponseBody
	@RequestMapping(value = "/getSubmit", method = RequestMethod.POST)
	public JSONResult getSubmit(@PathVariable("coursePath") String coursePath, @RequestBody SubmitVo submitVo) {
		System.out.println("getSubmit 실행");
		System.out.println(submitVo.toString());

		submitVo = assignmentService.getSubmit(submitVo.getSubmitNo());

		JSONResult jsonResult;
		if (submitVo != null) {
			jsonResult = JSONResult.success(submitVo);
		} else {
			jsonResult = JSONResult.error(null);
		}

		return jsonResult;
	}

	@Auth
	@ResponseBody
	@RequestMapping(value = "/deleteSubmit", method = RequestMethod.POST)
	public JSONResult deleteSubmit(@PathVariable("coursePath") String coursePath, @RequestBody SubmitVo submitVo,
			@AuthUser UserVo authUser) {
		System.out.println("deleteSubmit 실행");

		int count = assignmentService.deleteSubmit(submitVo.getSubmitNo(), authUser.getUserNo());

		JSONResult jsonResult;
		
		if (count != 0) {
			jsonResult = JSONResult.success(submitVo.getSubmitNo());
		} else {
			jsonResult = JSONResult.error(null);
		}

		return jsonResult;
	}

	@Auth
	@ResponseBody
	@RequestMapping(value = "/getAssignment", method = RequestMethod.POST)
	public JSONResult getAssignment(@PathVariable("coursePath") String coursePath,
			@RequestBody AssignmentVo assignmentVo) {
		System.out.println("getSubmit 실행");
		System.out.println(assignmentVo.toString());

		Map<String, Object> map = assignmentService.getAssignment(assignmentVo.getAssignmentNo());

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
	@RequestMapping(value = "/getChapterList", method = RequestMethod.POST)
	public JSONResult getChapterList(@PathVariable("coursePath") String coursePath, @RequestBody SubjectVo subjectVo) {
		System.out.println("getChapterList 실행");
		System.out.println(subjectVo.toString());

		List<ChapterVo> chapterList = assignmentService.getChapterList(subjectVo.getSubjectNo());

		JSONResult jsonResult;
		if (chapterList != null) {
			jsonResult = JSONResult.success(chapterList);
		} else {
			jsonResult = JSONResult.error(null);
		}

		return jsonResult;
	}
}
