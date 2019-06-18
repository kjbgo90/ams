package net.ourams.controller;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import net.ourams.interceptor.Auth;
import net.ourams.interceptor.AuthUser;
import net.ourams.util.S3Util;
import net.ourams.vo.UserVo;
import net.ourams.vo.fileUpLoadVo;

@Controller
@RequestMapping(value = "/{coursePath}/community")
public class CommunityController {

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

	// community registration form
	@Auth
	@RequestMapping("/regForm")
	public String scheduleForm(@PathVariable("coursePath") String coursePath, Model model, @AuthUser UserVo authUser) {
		System.out.println("community registration page");

		model.addAttribute("coursePath", coursePath);
		model.addAttribute("authUser", authUser);

		return "course/community/register-place";
	}
}
