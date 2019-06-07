package net.ourams.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.model.ObjectMetadata;

import net.ourams.service.CourseDataroomService;
import net.ourams.util.S3Util;

@Controller
@RequestMapping("/dataroom")
public class CourseDataroomController {

	@Autowired
	private S3Util s3Util;

	@Autowired
	private CourseDataroomService CourseDataroomService;

	private String bucketName = "net.ourams.upload";

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

	@RequestMapping("/form")
	public String dataroomForm() {
		return "course/course-dataroom";
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String fileUpload(@RequestParam("file") MultipartFile file, Model model) {
		System.out.println("aws 파일업로드");
		System.out.println(file.getOriginalFilename());
		String fileName = file.getOriginalFilename();
		s3Util.fileUpload(bucketName, file);
		s3Util.getFileURL(bucketName, fileName);
		String url = s3Util.getFileURL(bucketName, file.getOriginalFilename());
		model.addAttribute("url", url);
		
		return "redirect:/dataroom/form";
	}
}
