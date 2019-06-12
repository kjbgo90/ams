package net.ourams.controller;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import net.ourams.service.CourseDataroomService;
import net.ourams.util.S3Util;
import net.ourams.vo.CourseDataroomFileUploadVo;
import net.ourams.vo.CourseDataroomVo;

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
	
	@ResponseBody
	@RequestMapping(value = "/insertFolderByDataRoomNo")
	public CourseDataroomVo insertFolderByDataRoomNo(@RequestParam("dataRoomNo") int dataRoomNo) {
		
		CourseDataroomVo vo = CourseDataroomService.insertFolderByDataRoomNo(dataRoomNo);
		
		return vo;
	}
	

	@ResponseBody
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public CourseDataroomVo fileUpload(@RequestParam("file") MultipartFile file, Model model) {
		System.out.println("aws 파일업로드");
		System.out.println(file.getOriginalFilename());
		String fileName = file.getOriginalFilename();
		s3Util.fileUpload(bucketName, file);
		s3Util.getFileURL(bucketName, fileName);
		String url = s3Util.getFileURL(bucketName, file.getOriginalFilename());
		model.addAttribute("url", url);
		//확장자
				String exName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
				System.out.println("exName: " + exName);
				
		//파일사이즈
				long fileSize = file.getSize();
				System.out.println("fileSize: " + fileSize);

		//저장파일명
				String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
				System.out.println("saveName: " + saveName);
				
		//파일패스
				String filePath = s3Util.getFileURL(bucketName, file.getOriginalFilename());
				System.out.println("filePath: " + filePath);
				
		CourseDataroomVo vo = new CourseDataroomVo();
		vo.setFileName(fileName);
		vo.setFilePath(filePath);
		vo.setFileSize(fileSize);
		vo.setSaveName(saveName);
		System.out.println(vo.toString());
		return vo;
	}
	
	@ResponseBody
	@RequestMapping(value = "/fileUploadInDB", method = RequestMethod.POST)
	public int fileUploadInDB(@RequestBody CourseDataroomFileUploadVo fileVo) {
		int count = 0;
		System.out.println("fileUpLoad!!");
		System.out.println(fileVo.toString());
		CourseDataroomService.fileUploadInDB(fileVo);
		return count;
	}
	
	@ResponseBody
	@RequestMapping(value = "/SelectTagOnByDataTagNo")
	public List<CourseDataroomVo> SelectTagOnByDataTagNo(@RequestParam("dataTagNo") int dataTagNo){
		System.out.println(dataTagNo);
		List<CourseDataroomVo> list = CourseDataroomService.SelectTagOnByDataTagNo(dataTagNo);
		return list;
	}
	@ResponseBody
	@RequestMapping(value = "/fileList" , method = RequestMethod.POST)
	public List<CourseDataroomVo> getFileList(@RequestParam("courseNo") int courseNo,
											  @RequestParam("dataRoomNo") int dataRoomNo) {
		System.out.println("get file List");
		CourseDataroomVo vo = new CourseDataroomVo();
		System.out.println(dataRoomNo);
		vo.setDataRoomNo(dataRoomNo);
		List<CourseDataroomVo> list = CourseDataroomService.selectFileClickedByFolder(vo);
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/folderList" , method = RequestMethod.POST)
	public List<CourseDataroomVo> getFolderList(@RequestParam("courseNo") int courseNo,
												@RequestParam("dataRoomNo") int dataRoomNo) {
		System.out.println("get folder List");
		CourseDataroomVo vo = new CourseDataroomVo();
		System.out.println(dataRoomNo);
		vo.setDataRoomNo(dataRoomNo);
		List<CourseDataroomVo> list = CourseDataroomService.selectFolderClickedByFolder(vo);
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/tagList" , method = RequestMethod.POST)
	public List<CourseDataroomVo> getTagList() {
		System.out.println("get Tag List");
		List<CourseDataroomVo> list = CourseDataroomService.getTagList();
		return list;
	}
	

	
	
}
