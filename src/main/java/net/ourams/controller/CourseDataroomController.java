package net.ourams.controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import net.ourams.dao.CourseMainDao;
import net.ourams.interceptor.Auth;
import net.ourams.interceptor.AuthUser;
import net.ourams.service.CourseDataroomService;
import net.ourams.util.S3Util;
import net.ourams.vo.CourseDataroomFileUploadVo;
import net.ourams.vo.CourseDataroomVo;
import net.ourams.vo.CourseVo;
import net.ourams.vo.UserVo;

@Controller
@RequestMapping("/{coursePath}/dataroom")
public class CourseDataroomController {
	
	@Autowired
	private S3Util s3Util;

	@Autowired
	private CourseDataroomService CourseDataroomService;
	@Autowired
	private CourseMainDao mainDao;

	private String bucketName = "net.ourams.upload";

	
	
	// 테스트용
	@RequestMapping(value = "/init", method = RequestMethod.GET)
	public String init() {
		// 버킷생성 asdfadsfasdfadsfasdfa
		s3Util.createBucket(bucketName);

		// 버킷리스트
		System.out.println(s3Util.getBucketlist());

		// 폴더만들기
		System.out.println("폴더생성");
		s3Util.createFolder(bucketName, "img_test");

		return "redirect:/dataroom/form";
	}

	@Auth
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String dataroomForm(@PathVariable("coursePath") String coursePath, @AuthUser UserVo authUser, Model model) {
		CourseVo courseVo = mainDao.selectCourseVoByCoursePath(coursePath);
		System.out.println(courseVo.getCourseNo());
		model.addAttribute("coursePath",coursePath);
		int courseNo = courseVo.getCourseNo();
		model.addAttribute("courseNo",courseNo);
		
		return "course/course-dataroom";
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertFolderByDataRoomNo")
	public CourseDataroomVo insertFolderByDataRoomNo(@RequestParam("dataRoomNo") int dataRoomNo , 
													 @RequestParam("dataRoomName") String dataRoomName,
													 @RequestParam("courseNo") int courseNo) {
		
		CourseDataroomVo vo = new CourseDataroomVo();
		
		//원래 있던 dataroomno를 proomno 로 바꾸기 
		vo.setpRoomNo(dataRoomNo);
		vo.setDataRoomName(dataRoomName);
		vo.setCourseNo(courseNo);
				
		CourseDataroomService.insertFolderByDataRoomNo(vo);
		
		return vo;
	}
	

	@ResponseBody
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public CourseDataroomVo fileUpload(@RequestParam("file") MultipartFile file, Model model) {
		System.out.println("aws 파일업로드");
		System.out.println(file.getOriginalFilename());
		String fileName = file.getOriginalFilename();
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
				String filePath = s3Util.getFileURL(bucketName, saveName);
				
				s3Util.getFileURL(bucketName, saveName);
				System.out.println("filePath: " + filePath);
				
				s3Util.fileUpload(bucketName, file, exName, saveName);
				
				
				
				
				String url = s3Util.getFileURL(bucketName, saveName);
				model.addAttribute("url", url);
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
	public int fileUploadInDB( 	@RequestBody CourseDataroomFileUploadVo fileVo ,
								@AuthUser UserVo authUser) {
		int count = 0;
		
		int userNo = authUser.getUserNo();
		
		System.out.println("fileUpLoad!!");
		System.out.println(fileVo.toString());
		System.out.println(fileVo.getDataRoomNo());
		CourseDataroomService.fileUploadInDB( fileVo , fileVo.getCoursePath(), userNo);
		return count;
	}
	
	@ResponseBody
	@RequestMapping(value = "/SelectTagOnByDataTagNo")
	public List<CourseDataroomVo> SelectTagOnByDataTagNo(@PathVariable("coursePath") String coursePath, @RequestParam("dataTagNo") int dataTagNo){
		System.out.println(dataTagNo);
		
		
		
		CourseVo courseVo = mainDao.selectCourseVoByCoursePath(coursePath);
		System.out.println(courseVo.getCourseNo());
		
		int courseNo = courseVo.getCourseNo();
		
		
		List<CourseDataroomVo> list = CourseDataroomService.SelectTagOnByDataTagNo(dataTagNo ,courseNo);
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
	
	@ResponseBody
	@RequestMapping(value = "/selectFolderVo")
	public int selectFolderVo(@RequestParam("dataRoomNo") int dataRoomNo) {
		System.out.println("proomno");
		System.out.println(dataRoomNo);
		int pRoomNo = CourseDataroomService.selectFolderVo(dataRoomNo);
		System.out.println(pRoomNo);
		return pRoomNo;
	}
	
	@ResponseBody
	@RequestMapping(value = "/downloadFile", method = RequestMethod.GET)
	public String  downloadFile(@RequestParam("fileNo") int fileNo,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("****************************************");
		
		System.out.println("download file");
		
		System.out.println(fileNo);
		CourseDataroomVo vo2 = new CourseDataroomVo();
		vo2.setFileNo(fileNo);
		CourseDataroomVo vo = CourseDataroomService.downloadFile(vo2);
		
		System.out.println("****************************************");
		System.out.println(vo);
		System.out.println("****************************************");
		
		s3Util.cvplFileDownload(request, response ,vo);
		 
		return "";
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value = "/deleteFolder" , method = RequestMethod.POST)
	public int deleteFolder(@RequestParam("dataRoomNo") int dataRoomNo) {
		CourseDataroomVo vo = new CourseDataroomVo();
		vo.setDataRoomNo(dataRoomNo);
		if(CourseDataroomService.deleteFolder(vo) == true) {
			System.out.println("complete");
			int aa = 1;
			return aa;
		}else {
			System.out.println("uncomplete");
			int aa= 0;
			return aa;
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	public int deleteFile(@RequestParam("fileNo") int fileNo){
		System.out.println("delete" + fileNo);
		CourseDataroomVo vo = new CourseDataroomVo();
		vo.setFileNo(fileNo);
		int count = CourseDataroomService.deleteFile(vo);
		return count;
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectListAtFirst", method = RequestMethod.POST)
	public CourseDataroomVo selectListAtFirst(@RequestParam("courseNo") int courseNo) {
		System.out.println("let's start dataroom ");
		CourseDataroomVo vo = new CourseDataroomVo();
		vo.setCourseNo(courseNo);
		vo.setpRoomNo(0);
		CourseDataroomVo vo2 = CourseDataroomService.selectListAtFirst(vo);
		return vo2;
	}
}
