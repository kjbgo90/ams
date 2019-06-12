package net.ourams.controller;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import net.ourams.interceptor.Auth;
import net.ourams.interceptor.AuthUser;
import net.ourams.service.CourseAssignmentService;
import net.ourams.util.JSONResult;
import net.ourams.util.S3Util;
import net.ourams.vo.AssignmentVo;
import net.ourams.vo.ChapterVo;
import net.ourams.vo.SubjectVo;
import net.ourams.vo.SubmitVo;
import net.ourams.vo.UserVo;
import net.ourams.vo.fileUpLoadVo;

@Controller
@RequestMapping(value = "/{coursePath}/assignment")
public class CourseAssignmentController {

	@Autowired
	private CourseAssignmentService assignmentService;

	@Autowired
	private S3Util s3Util;

	private String bucketName = "net.ourams.assignment";

	// 테스트용
	@RequestMapping(value = "/init", method = RequestMethod.GET)
	public String init() {
		// 버킷생성
		s3Util.createBucket(bucketName);

		// 버킷리스트
		System.out.println(s3Util.getBucketlist());

		// 폴더만들기

		return "redirect:/dataroom/form";
	}

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
			model.addAttribute("courseVo", map.get("courseVo"));

			return "course/assignment/assignment-enroll";
		} else {
			return "course/page-404";
		}
	}

	@Auth
	@RequestMapping(value = "/assignmentModifyForm", method = RequestMethod.GET)
	public String assignmentModify(@PathVariable("coursePath") String coursePath, @AuthUser UserVo authUser,
			Model model, @RequestParam("assignmentNo") int assignmentNo) {
		System.out.println("assignmentModifyForm 실행");

		Map<String, Object> map = assignmentService.getModifyPage(coursePath ,assignmentNo);

		model.addAttribute("assignmentVo", map.get("assignmentVo"));
		model.addAttribute("authUser", authUser);
		model.addAttribute("coursePath", coursePath);
		model.addAttribute("subjectList", map.get("subjectList"));
		model.addAttribute("courseVo", map.get("courseVo"));
		
		return "course/assignment/assignment-modify";
	}

	@Auth
	@ResponseBody
	@RequestMapping(value = "/modifyAssignment", method = RequestMethod.POST)
	public JSONResult modifyAssignment(@PathVariable("coursePath") String coursePath, @RequestBody AssignmentVo assignmentVo) {
		System.out.println("modifyAssignment 실행");
		System.out.println(assignmentVo.toString());

		String str = assignmentVo.getEndDate();

		String endDate = "";
		endDate += str.split(" ")[3];

		String month = str.split(" ")[1];
		switch (month) {

		case "Jan":
			month = "-01";
			break;

		case "Feb":
			month = "-02";
			break;

		case "Mar":
			month = "-03";
			break;

		case "Apr":
			month = "-04";
			break;

		case "May":
			month = "-05";
			break;

		case "Jun":
			month = "-06";
			break;

		case "Jul":
			month = "-07";
			break;

		case "Aug":
			month = "-08";
			break;

		case "Sep":
			month = "-09";
			break;

		case "Oct":
			month = "-10";
			break;

		case "Nov":
			month = "-11";
			break;

		case "Dec":
			month = "-12";
			break;
		}

		endDate += month;

		endDate += "-" + str.split(" ")[2];
		System.out.println(endDate);
		assignmentVo.setEndDate(endDate);

		int count = assignmentService.modifyAssignment(assignmentVo);

		JSONResult jsonResult;
		if (count != 0) {
			jsonResult = JSONResult.success(coursePath);
		} else {
			jsonResult = JSONResult.error(null);
		}

		return jsonResult;
	}
	
	@Auth
	@ResponseBody
	@RequestMapping(value = "/submit", method = RequestMethod.POST)
	public JSONResult assignmentSubmit(@PathVariable("coursePath") String coursePath, @RequestBody SubmitVo submitVo) {
		System.out.println("assignmentSubmit 실행");
		System.out.println(submitVo.toString());

		submitVo = assignmentService.submit(submitVo);

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
		System.out.println("getAssignment 실행");
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

	@Auth
	@ResponseBody
	@RequestMapping(value = "/enrollAssignment", method = RequestMethod.POST)
	public JSONResult enrollAssignment(@PathVariable("coursePath") String coursePath,
			@RequestBody AssignmentVo assignmentVo) {
		System.out.println("enrollAssignment 실행");
		System.out.println(assignmentVo.toString());

		String str = assignmentVo.getEndDate();

		String endDate = "";
		endDate += str.split(" ")[3];

		String month = str.split(" ")[1];
		switch (month) {

		case "Jan":
			month = "-01";
			break;

		case "Feb":
			month = "-02";
			break;

		case "Mar":
			month = "-03";
			break;

		case "Apr":
			month = "-04";
			break;

		case "May":
			month = "-05";
			break;

		case "Jun":
			month = "-06";
			break;

		case "Jul":
			month = "-07";
			break;

		case "Aug":
			month = "-08";
			break;

		case "Sep":
			month = "-09";
			break;

		case "Oct":
			month = "-10";
			break;

		case "Nov":
			month = "-11";
			break;

		case "Dec":
			month = "-12";
			break;
		}

		endDate += month;

		endDate += "-" + str.split(" ")[2];
		System.out.println(endDate);
		assignmentVo.setEndDate(endDate);

		int count = assignmentService.enrollAssignment(assignmentVo);

		JSONResult jsonResult;
		if (count != 0) {
			jsonResult = JSONResult.success(coursePath);
		} else {
			jsonResult = JSONResult.error(null);
		}

		return jsonResult;
	}
	
	@Auth
	@ResponseBody
	@RequestMapping(value = "/saveScore", method = RequestMethod.POST)
	public JSONResult saveScore(@PathVariable("coursePath") String coursePath, @RequestBody SubmitVo submitVo) {
		System.out.println("saveScore 실행");
		System.out.println(submitVo.toString());

		int count = assignmentService.saveScore(submitVo);

		JSONResult jsonResult;
		if (count != 0) {
			jsonResult = JSONResult.success(submitVo);
		} else {
			jsonResult = JSONResult.error(null);
		}

		return jsonResult;
	}

	@ResponseBody
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public fileUpLoadVo fileUpload(@RequestParam("file") MultipartFile file, Model model) {
		System.out.println("aws 파일업로드");
		System.out.println(file.getOriginalFilename());
		String fileName = file.getOriginalFilename();
		s3Util.fileUpload(bucketName, file);
		s3Util.getFileURL(bucketName, fileName);
		String url = s3Util.getFileURL(bucketName, file.getOriginalFilename());
		// 확장자
		String exName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		System.out.println("exName: " + exName);

		// 파일사이즈
		long fileSize = file.getSize();
		System.out.println("fileSize: " + fileSize);

		// 저장파일명
		String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
		System.out.println("saveName: " + saveName);

		// 파일패스
		String filePath = url;
		System.out.println("filePath: " + filePath);

		fileUpLoadVo vo = new fileUpLoadVo();
		vo.setFileName(fileName);
		vo.setFilepath(filePath);
		vo.setFileSize(fileSize);
		vo.setSaveName(saveName);
		System.out.println(vo.toString());
		return vo;
	}

}
