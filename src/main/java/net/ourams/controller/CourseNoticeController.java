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
import net.ourams.service.CourseReplyService;
import net.ourams.service.PostService;
import net.ourams.service.UserService;
import net.ourams.util.JSONResult;
import net.ourams.util.S3Util;
import net.ourams.vo.CourseVo;
import net.ourams.vo.PostVo;
import net.ourams.vo.ReplyVo;
import net.ourams.vo.UserVo;
import net.ourams.vo.fileUpLoadVo;

@Controller
@RequestMapping(value = "/{coursePath}/notice")
public class CourseNoticeController {

	@Autowired
	private PostService postService;
	@Autowired
	private UserService userService;
	@Autowired
	private CourseReplyService courseReplyService;
	@Autowired
	private CourseMainDao mainDao;

	@Autowired
	private S3Util s3Util;

	private String bucketName = "net.ourams.notice";

	// 테스트용
	@RequestMapping(value = "/init", method = RequestMethod.GET)
	public String init() {
		// 버킷생성
		s3Util.createBucket(bucketName);

		// 버킷리스트
		System.out.println(s3Util.getBucketlist());

		// 폴더만들기
		System.out.println("폴더생성");
		s3Util.createFolder(bucketName, "img_test");

		return "redirect:/dataroom/form";
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

	/* 리스트 기본 */
	@Auth
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String noticeList(@PathVariable("coursePath") String coursePath, @AuthUser UserVo authUser, Model model) {
		System.out.println("list");
		model.addAttribute("coursePath", coursePath);
		return "course/notice/notice-list";
	}
	
	
	//페이징 한것들 
	@ResponseBody
	@RequestMapping(value = "/selectPostPaging", method = RequestMethod.POST)
	public Map<String, Object> selectPostPaging(@PathVariable("coursePath") String coursePath,
												@RequestParam("pageNo") int pageNo) {
		System.out.println("selectPostPaging");
		CourseVo courseVo = mainDao.selectCourseVoByCoursePath(coursePath);
		System.out.println(courseVo.getCourseNo());
		Map<String, Object> map = postService.selectPostPaging(courseVo.getCourseNo(), pageNo);
		return map;
	}

	// 검색해서 페이징 만들어 부렸다 
	@ResponseBody
	@RequestMapping(value = "/searchList", method = RequestMethod.POST)
	public Map<String, Object> searchList( @PathVariable("coursePath") String coursePath,
									@RequestParam("pageNo") int pageNo,
								 	@RequestParam("postTitle") String postTitle) {
		System.out.println("searchList");
		CourseVo courseVo = mainDao.selectCourseVoByCoursePath(coursePath);
		System.out.println(courseVo.getCourseNo());
		Map<String, Object> map = postService.searchList(postTitle, courseVo.getCourseNo(), pageNo);
		return map;
	}
	
	/* 글읽기 */
	@Auth
	@RequestMapping(value = "/read/{postNo}", method = RequestMethod.GET)
	public String noticeRead(@PathVariable("coursePath") String coursePath, @AuthUser UserVo authUser,
			@PathVariable("postNo") int postNo, Model model) {
		System.out.println("read");
		PostVo postVo = postService.read(postNo);
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

		return "course/notice/notice-read";
	}

	/* 글저장 */
	@Auth
	@ResponseBody
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(@PathVariable("coursePath") String coursePath, @AuthUser UserVo authUser,
			@ModelAttribute PostVo postVo, HttpSession session, @RequestBody PostVo resJSON, HttpServletRequest re) {
		System.out.println("###write###");
		System.out.println("###test### 10");

		System.out.println(resJSON.getPostTitle());
		postVo.setUserNo(authUser.getUserNo());
		postVo.setPostContent(resJSON.getPostContent());
		postVo.setPostTitle(resJSON.getPostTitle());
		postVo.setCategory(resJSON.getCategory());
		postVo.setUserName(authUser.getUserName());
		postVo.setFileList(resJSON.getFileList());
		postVo.setCoursePath(coursePath);
		System.out.println(resJSON.toString());
		if(resJSON.getSelectedDate() == "" ) {
			postService.write(postVo);
			System.out.println(coursePath);

			return coursePath;
		} else {
			String str = resJSON.getSelectedDate();
			System.out.println(str);
			String selectedDate = "";
			selectedDate += str.split(" ")[3];

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

			selectedDate += month;

			selectedDate += "-" + str.split(" ")[2];
			System.out.println(selectedDate);
			postVo.setSelectedDate(selectedDate);
			
			postService.writePostSchedule(postVo);
			
			return coursePath;
		}
	}

	/* 글업데이트 */
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
		postVo.setCategory(resJSON.getCategory());
		postVo.setRegDate(resJSON.getRegDate());
		postVo.setUserName(authUser.getUserName());
		postService.update(postVo);
		System.out.println(coursePath);

		return coursePath;
	}

	/* 글쓰기폼 */
	@Auth
	@RequestMapping(value = "/writeform", method = RequestMethod.GET)
	public String noticeWrite(@PathVariable("coursePath") String coursePath, Model model, HttpServletRequest re) {
		System.out.println("writeform 3");

		model.addAttribute("coursePath", coursePath);
		return "course/notice/notice-write";
	}

	/* 글삭제 */
	@Auth
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String noticeDelete(@RequestParam int postNo, @ModelAttribute PostVo postVo,
			@PathVariable("coursePath") String coursePath, @AuthUser UserVo authUser, HttpSession session) {
		System.out.println("delete");
		postVo.setPostNo(postNo);
		postVo.setUserNo(authUser.getUserNo());

		int count = postService.delete(postVo);
		System.out.println("####삭제####");
		System.out.println(count);

		return "redirect:/" + coursePath + "/notice/list";
	}

	/* 글 수정폼 */
	@Auth
	@RequestMapping(value = "/modifyform", method = RequestMethod.GET)
	public String modifyform(@RequestParam int postNo, @ModelAttribute PostVo postVo,
			@PathVariable("coursePath") String coursePath, @AuthUser UserVo authUser, Model model) {
		postVo = postService.modifyform(postNo);
		model.addAttribute("postVo", postVo);
		return "course/notice/notice-modify";
	}

	@Auth
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyform(@ModelAttribute PostVo postVo, @PathVariable("coursePath") String coursePath,
			@AuthUser UserVo authUser, Model model, HttpSession session) {

		postVo.setUserNo(authUser.getUserNo());
		int count = postService.modify(postVo);

		return "redirect:/" + coursePath + "/notice/read/" + postVo.getPostNo();
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
	
	

	@Auth
	@ResponseBody
	@RequestMapping(value = "/getFileList", method = RequestMethod.POST)
	public JSONResult getFileList(@PathVariable("coursePath") String coursePath,
			@RequestBody PostVo postVo) {
		System.out.println("getFileList 실행");
		System.out.println(postVo.toString());

		List<fileUpLoadVo> fileList = postService.getFileList(postVo);

		JSONResult jsonResult;
		if (fileList != null) {
			jsonResult = JSONResult.success(fileList);
		} else {
			jsonResult = JSONResult.error(null);
		}

		return jsonResult;
	}
	
	

}
