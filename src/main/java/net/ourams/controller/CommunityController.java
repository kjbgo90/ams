package net.ourams.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
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
import net.ourams.service.CommunityReplyService;
import net.ourams.service.CommunityService;
import net.ourams.service.UserService;
import net.ourams.util.S3Util;
import net.ourams.util.TimeUtile;
import net.ourams.vo.CommunityVo;
import net.ourams.vo.ReplyVo;
import net.ourams.vo.UserVo;
import net.ourams.vo.fileUpLoadVo;

@Controller
@RequestMapping(value = "/community")
public class CommunityController {

	@Autowired
	private CommunityService communityService;
	@Autowired
	private UserService userService;
	@Autowired
	private CommunityReplyService communityReplyService;

	@Autowired
	private S3Util s3Util;

	private String bucketName = "net.ourams.assignment";

	// community main list
	@RequestMapping(value = "/mainform", method = RequestMethod.GET)
	public String mainForm(Model model) {
		System.out.println("mainform");
		List<CommunityVo> MainEatList = communityService.getMainEatList();
		List<CommunityVo> MaincafeList = communityService.getMaincafeList();
		List<CommunityVo> MainList = communityService.getMainList();
		
		
		model.addAttribute("MainEatList", MainEatList);
		model.addAttribute("MaincafeList", MaincafeList);
		model.addAttribute("MainList", MainList);
		return "community/community-main";
	}

	// community write form
	@Auth
	@RequestMapping(value = "/writeform", method = RequestMethod.GET)
	public String scheduleForm(@AuthUser UserVo authUser, Model model) {
		System.out.println("writeform");
		model.addAttribute("authUser", authUser);
		return "community/community-register";
	}
	
	// community category detail list
	@Auth
	@RequestMapping(value = "/selectform", method = RequestMethod.GET)
	public String selectForm(Model model, @RequestParam("cpostType") int cpostType) throws ParseException {
		System.out.println("selectform(Type: "+cpostType+")");
		List<CommunityVo> communityList = communityService.getList(cpostType);
		List<CommunityVo> getlikedList = communityService.getlikedList();
		for (CommunityVo el : communityList) {
			System.out.println(el.getRegDate());
			String from = el.getRegDate();

			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			Date to = transFormat.parse(from);
			System.out.println(to);
			System.out.println(to.getTime());
			el.setRegDate(TimeUtile.toDuration(new Date().getTime() - to.getTime()));
		};
		for (CommunityVo el : getlikedList) {
			System.out.println(el.getRegDate());
			String from = el.getRegDate();

			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			Date to = transFormat.parse(from);
			System.out.println(to);
			System.out.println(to.getTime());
			el.setRegDate(TimeUtile.toDuration(new Date().getTime() - to.getTime()));
		}
		;
		model.addAttribute("communityList", communityList);
		model.addAttribute("getlikedList", getlikedList);
	
		return "community/community-list";
	}

	/*
	 * @ResponseBody
	 * 
	 * @Auth
	 * 
	 * @RequestMapping(value = "/dueDate", method = RequestMethod.POST) public
	 * List<CommunityVo> loadDifferentiate() {
	 * System.out.println("calculate differentiate...");
	 * 
	 * List<CommunityVo> communityList = communityService.getList();
	 * 
	 * return communityList; }
	 */

	// community category detail list
	@Auth
	@RequestMapping(value = "/read/{cpostNo}", method = RequestMethod.GET)
	public String communityRead(@PathVariable("cpostNo") int cpostNo, @AuthUser UserVo authUser, Model model) {
		System.out.println("read");
		CommunityVo communityvo = communityService.read(cpostNo);
		List<ReplyVo> replylist = communityReplyService.getcreplyList(cpostNo);
		System.out.println(replylist.toString());
		UserVo writerVo = userService.read(communityvo.getUserNo());
		model.addAttribute("CommunityVo", communityvo);
		model.addAttribute("replylist", replylist);
		model.addAttribute("WriterVo", writerVo);
		System.out.println(communityvo);

		return "community/community-read";
	}

	@Auth
	@ResponseBody
	@RequestMapping(value = "/comment/regist", method = RequestMethod.POST)
	public ReplyVo commentRegist(@AuthUser UserVo authUser, @RequestParam("cpostNo") int cpostNo,
			@RequestParam("creplyContent") String replyContent) {
		ReplyVo replyVo = communityReplyService.commentRegistAndGetReplyVo(authUser, cpostNo, replyContent);
		System.out.println("replyVo : " + replyVo);
		return replyVo;
	}

	@Auth
	@ResponseBody
	@RequestMapping(value = "/comment/delete", method = RequestMethod.POST)
	public int commentDelete(@RequestParam("reply") int reply) {
		return communityReplyService.commentDelete(reply);
	}

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
	
	
	@Auth
	@ResponseBody
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public int registerPost(@RequestBody CommunityVo vo, @AuthUser UserVo authUser) {
		System.out.println("register new post on community...");
		System.out.println("post info: " + vo.toString() + ", location info: " + vo.locationInfo());
		
		return communityService.registerPost(authUser, vo);
	}
	
	public static String toDuration(long duration) {

		StringBuffer res = new StringBuffer();

		if ("".equals(res.toString()))
			return "0 seconds ago";
		else
			return res.toString();
	}

}
