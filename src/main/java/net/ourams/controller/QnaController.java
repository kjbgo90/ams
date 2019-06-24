package net.ourams.controller;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import net.ourams.dao.CourseMainDao;
import net.ourams.interceptor.Auth;
import net.ourams.interceptor.AuthUser;
import net.ourams.service.CourseQnaService;
import net.ourams.service.CourseReplyService;
import net.ourams.service.UserService;
import net.ourams.util.JSONResult;
import net.ourams.util.S3Util;
import net.ourams.vo.AssignmentVo;
import net.ourams.vo.CourseVo;
import net.ourams.vo.PostVo;
import net.ourams.vo.ReplyVo;
import net.ourams.vo.SubjectVo;
import net.ourams.vo.UserVo;
import net.ourams.vo.fileUpLoadVo;

@Controller
@RequestMapping(value="/{coursePath}/qna")
public class QnaController {
	
	@Autowired
	private CourseQnaService courseQnaService;
	@Autowired
	private UserService userService;
	@Autowired
	private CourseReplyService courseReplyService;
	@Autowired
	private CourseMainDao mainDao;

	@Autowired
	private S3Util s3Util;

	private String bucketName = "net.ourams.notice";


	/* 리스트 기본 */
	@Auth
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String qnaList(@PathVariable("coursePath") String coursePath, @AuthUser UserVo authUser, Model model) {
		System.out.println("list");
		CourseVo courseVo = mainDao.selectCourseVoByCoursePath(coursePath);
		System.out.println(courseVo.getCourseNo());
		model.addAttribute("coursePath",coursePath);
		return "course/qna/qna-list";
	}
	
	

	@ResponseBody
	@RequestMapping(value = "/selectPostPaging", method = RequestMethod.POST)
	public Map<String, Object> selectPostPaging(@PathVariable("coursePath") String coursePath, @RequestParam("pageNo") int pageNo) {
		System.out.println("selectPostPaging");
		CourseVo courseVo = mainDao.selectCourseVoByCoursePath(coursePath);
		System.out.println(courseVo.getCourseNo());

		Map<String, Object> map = courseQnaService.selectListPaging(pageNo, courseVo.getCourseNo());
		return map;
	}

	//검색 + 페이징 
	@ResponseBody
	@RequestMapping(value = "/searchList", method = RequestMethod.POST)
	public Map<String, Object> searchList(	@PathVariable("coursePath") String coursePath, 
									@RequestParam("pageNo") int pageNo,
									@RequestParam("postTitle") String postTitle) {
		System.out.println("searchList");
		CourseVo courseVo = mainDao.selectCourseVoByCoursePath(coursePath);
		System.out.println(courseVo.getCourseNo());
		Map<String, Object> map = courseQnaService.searchList(postTitle ,pageNo, courseVo.getCourseNo());
		return map;
	}
	
	@Auth
	@RequestMapping(value = "/read/{postNo}", method = RequestMethod.GET)
	public String qnaRead(@PathVariable("coursePath") String coursePath, @AuthUser UserVo authUser,
						  @PathVariable("postNo") int postNo, Model model) {
		System.out.println("read");
		PostVo postVo = courseQnaService.read(postNo);
		List<ReplyVo> replylist = courseReplyService.getreplyList(postNo);
		System.out.println(replylist.toString());
		UserVo writerVo = userService.read(postVo.getUserNo());
		model.addAttribute("PostVo", postVo);
		model.addAttribute("replylist", replylist);
		model.addAttribute("WriterVo", writerVo);
		System.out.println(postVo.getCategory());
		System.out.println(postVo);
		model.addAttribute("UserVo", authUser);
		model.addAttribute("coursePath", coursePath);

		
		return "course/qna/qna-read";
	}
	
	/* 글쓰기폼 */
	@Auth
	@RequestMapping(value = "/writeform", method = RequestMethod.GET)
	public String qnaWrite(@PathVariable("coursePath") String coursePath, Model model, HttpServletRequest re) {
		System.out.println("writeform");
		int courseNo=1;
		List<SubjectVo> subjectList  = courseQnaService.getsubjectList(courseNo);
		System.out.println("##############################33");
		System.out.println(subjectList);
		model.addAttribute("subjectList", subjectList);
		model.addAttribute("coursePath", coursePath);
		return "course/qna/qna-write";
	}
	
	/* 글저장 */
	@Auth
	@ResponseBody
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(@PathVariable("coursePath") String coursePath, @AuthUser UserVo authUser,
			@ModelAttribute PostVo postVo, HttpSession session, @RequestBody PostVo resJSON, HttpServletRequest re) {
		System.out.println("###write###");

		System.out.println(resJSON.getPostTitle());
		postVo.setUserNo(authUser.getUserNo());
		postVo.setPostContent(resJSON.getPostContent());
		postVo.setPostTitle(resJSON.getPostTitle());
		postVo.setSubjectNo(resJSON.getSubjectNo());
		postVo.setRegDate(resJSON.getRegDate());
		postVo.setUserName(authUser.getUserName());
		postVo.setFileList(resJSON.getFileList());
		courseQnaService.write(postVo);
		postVo.setCoursePath(coursePath);
		System.out.println(coursePath);
		
		return coursePath;
	}
	
	@Auth
	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(@PathVariable("coursePath") String coursePath, @AuthUser UserVo authUser,
			@ModelAttribute PostVo postVo, HttpSession session, @RequestBody PostVo resJSON, HttpServletRequest re) {
		System.out.println("###update###");

		System.out.println(resJSON.getPostTitle());
		postVo.setUserNo(authUser.getUserNo());
		postVo.setPostContent(resJSON.getPostContent());
		postVo.setPostTitle(resJSON.getPostTitle());
		postVo.setPostNo(resJSON.getPostNo());
		postVo.setSubjectNo(resJSON.getSubjectNo());
		postVo.setRegDate(resJSON.getRegDate());
		postVo.setUserName(authUser.getUserName());
		courseQnaService.update(postVo);
		System.out.println(coursePath);

		return coursePath;
	}

	
	/* 글삭제 */
	@Auth
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String noticeDelete(@RequestParam int postNo, @ModelAttribute PostVo postVo,
			@PathVariable("coursePath") String coursePath, @AuthUser UserVo authUser, HttpSession session) {
			System.out.println("delete");
			postVo.setPostNo(postNo);
			postVo.setUserNo(authUser.getUserNo());

			int count = courseQnaService.delete(postVo);
			System.out.println("####삭제####");
			System.out.println(count);

			return "redirect:/" + coursePath + "/qna/list";
	}
	
	

	/* 글 수정폼 */
	@Auth
	@RequestMapping(value = "/modifyform", method = RequestMethod.GET)
	public String modifyform(@RequestParam int postNo, @RequestParam("subjectNo") int subjectNo,  @ModelAttribute PostVo postVo,
			@PathVariable("coursePath") String coursePath, @AuthUser UserVo authUser, Model model) {
		postVo = courseQnaService.modifyform(postNo);
		System.out.println("subjectNo" + subjectNo);
		String subjectTitle = "과목선택";
		int courseNo=1;
		List<SubjectVo> subjectList  = courseQnaService.getsubjectList(courseNo);
		for(int i=0; i<subjectList.size(); i++) {
			if (subjectList.get(i).getSubjectNo() == subjectNo) {
				subjectTitle = subjectList.get(i).getSubjectTitle();
			}
		}
		System.out.println("##############################33");
		System.out.println(subjectList);
		model.addAttribute("subjectList", subjectList);
		model.addAttribute("postVo", postVo);
		model.addAttribute("subjectNo", subjectNo);
		model.addAttribute("subjectTitle", subjectTitle);

		return "course/qna/qna-modify";
	}
	
	@Auth
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyform(@ModelAttribute PostVo postVo, @PathVariable("coursePath") String coursePath,
			@AuthUser UserVo authUser, Model model, HttpSession session) {

		postVo.setUserNo(authUser.getUserNo());
		int count = courseQnaService.modify(postVo);

		return "redirect:/" + coursePath + "/qna/read/" + postVo.getPostNo();
	}

	@Auth
	@ResponseBody
	@RequestMapping(value = "/comment/regist", method = RequestMethod.POST)
	public ReplyVo commentRegist(@AuthUser UserVo authUser, @RequestParam("postNo") int postNo,
			@RequestParam("replyContent") String replyContent) {

		return courseReplyService.commentRegistAndGetReplyVo(authUser, postNo, replyContent);
	}

	@Auth
	@ResponseBody
	@RequestMapping(value = "/comment/delete", method = RequestMethod.POST)
	public int commentDelete(@RequestParam("reply") int reply) {
		return courseReplyService.commentDelete(reply);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public fileUpLoadVo fileUpload(@RequestParam("file") MultipartFile file, Model model) {
		System.out.println("aws 파일업로드");
		System.out.println(file.getOriginalFilename());
		String fileName = file.getOriginalFilename();
		s3Util.getFileURL(bucketName, fileName);

		// 확장자
		String exName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		System.out.println("exName: " + exName);

		// 파일사이즈
		long fileSize = file.getSize();
		System.out.println("fileSize: " + fileSize);

		// 저장파일명
		String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
		System.out.println("saveName: " + saveName);

		String url = s3Util.getFileURL(bucketName, saveName);
		// 파일패스
		String filePath = s3Util.getFileURL(bucketName, saveName);
		System.out.println("filePath: " + filePath);
		s3Util.fileUpload(bucketName, file, exName, saveName);

		fileUpLoadVo vo = new fileUpLoadVo();
		vo.setFileName(fileName);
		vo.setFilepath(filePath);
		vo.setFileSize(fileSize);
		vo.setSaveName(saveName);
		System.out.println(vo.toString());
		return vo;
	}
	
	
	

	@Auth
	@ResponseBody
	@RequestMapping(value = "/getFileList", method = RequestMethod.POST)
	public JSONResult getFileList(@PathVariable("coursePath") String coursePath,
			@RequestBody PostVo postVo) {
		System.out.println("getFileList 실행");
		System.out.println(postVo.toString());

		List<fileUpLoadVo> fileList = courseQnaService.getFileList(postVo);

		JSONResult jsonResult;
		if (fileList != null) {
			jsonResult = JSONResult.success(fileList);
		} else {
			jsonResult = JSONResult.error(null);
		}

		return jsonResult;
	}
	
	
}
