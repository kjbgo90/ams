package net.ourams.service;

import java.util.List;

import org.eclipse.jdt.internal.compiler.ast.AND_AND_Expression;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.ourams.dao.CourseDataroomDao;
import net.ourams.vo.CourseDataroomFileUploadVo;
import net.ourams.vo.CourseDataroomVo;
import net.ourams.vo.CourseVo;
import net.ourams.vo.TimelineVo;
import net.ourams.vo.UserVo;

@Service
public class CourseDataroomService {

	@Autowired
	private CourseDataroomDao courseDataroomDao;
	
	
	
	
	public CourseDataroomVo insertFolderByDataRoomNo(CourseDataroomVo vo) {
		
		int count = courseDataroomDao.insertFolder(vo);
		int no = vo.getDataRoomNo();
		System.out.println(no);
		return vo;
	}
	
	public List<CourseDataroomVo> getTagList(){
		List<CourseDataroomVo> list = courseDataroomDao.selectTagList();
		return list;
	}
	
	public List<CourseDataroomVo> getDataRoomRootList(){
		CourseDataroomVo vo = new CourseDataroomVo();
		vo.setpRoomNo(0);
		vo.setCourseNo(1);
		List<CourseDataroomVo> list = courseDataroomDao.getDataRoomRootList(vo);
		return list;
	}
	
	

	public List<CourseDataroomVo> getDataRoomRoot(){
		CourseDataroomVo vo = new CourseDataroomVo();
		vo.setCourseNo(1);
		List<CourseDataroomVo> list = courseDataroomDao.getDataRoomRoot(vo);
		return list;
	}
	

	public List<CourseDataroomVo> SelectTagOnByDataTagNo(int dataTagNo){
		CourseDataroomVo vo = new CourseDataroomVo();
		vo.setCourseNo(1);
		System.out.println(dataTagNo);
		vo.setDataTagNo(dataTagNo);
		List<CourseDataroomVo> list = courseDataroomDao.SelectTagOnByDataTagNo(vo);
		return list;
	}
	
	public List<CourseDataroomVo> getDataTagList(CourseDataroomVo vo){
		vo.setCourseNo(1);
		List<CourseDataroomVo> list = courseDataroomDao.getDataTagList(vo);
		return list;
	}
	
	public int fileUploadInDB(CourseDataroomFileUploadVo fileVo, String coursePath, int userNo) {
		System.out.println("help me");
		
		CourseDataroomVo vo = new CourseDataroomVo();
		vo.setFileName(fileVo.getFileName());
		vo.setFilePath(fileVo.getFilePath());
		vo.setFileSize(fileVo.getFileSize());
		vo.setSaveName(fileVo.getSaveName());
		
		vo.setDataRoomNo(fileVo.getDataRoomNo());
		System.out.println(vo.toString());
		courseDataroomDao.insertFileUpLoad(vo);
		

		
		TimelineVo vo2 = new TimelineVo();
		vo2.setUserNo(userNo);
		System.out.println(userNo);
		CourseVo coursevo = new CourseVo();
		coursevo.setCoursePath(coursePath);
		CourseVo coursevo2 = courseDataroomDao.selectCoursePath(coursevo);
		System.out.println("coursePath is" + coursePath);
		String courseName = coursevo2.getCourseName();
		System.out.println("courseName is " + courseName);
		
		
		String timeLineContent = "["+courseName+"]"+coursevo2.getCourseName()+"에 파일이 올라왔습니다!</p>";
		
		// timeline 테이블에 저장  
		vo2.setTimeLineContent(timeLineContent);
		
		
		courseDataroomDao.insertTimeline(vo2);
		
		
		System.out.println("timeline no is "+vo2.getTimeLineNo());
		
		
		int timeLineNo = vo2.getTimeLineNo();
		// 코스 안에 있는 모든 유저들을 등록하자 ! 
		List<UserVo> list2 = courseDataroomDao.selectListbyCoursePath(coursevo);
		System.out.println(list2.toString());
		for(int i = 0; i < list2.size() ; i ++) {
			int userNo2 = list2.get(i).getUserNo();
			System.out.println(userNo2);
			System.out.println("user No is "+userNo2);
			TimelineVo vo3 = new TimelineVo();
			vo3.setUserNo(userNo2);
			vo3.setTimeLineNo(timeLineNo);
			
			//timelineuser 테이블에 저장 
			courseDataroomDao.insertTimelineUser(vo3);
			
		}
		System.out.println(vo);
		
		
		
		
		int fileNo = vo.getFileNo();
		System.out.println(fileNo);
		courseDataroomDao.insertDataRoomFile(vo);
		int dataRoomFileNo = vo.getDataRoomFileNo();
		System.out.println(dataRoomFileNo);
		System.out.println(vo.toString());
		List<Integer> list = fileVo.getTagNoList();
		System.out.println(list.toString());
		System.out.println(list.size());
		
		for(int i=0; i<list.size(); i ++) {
			int a = list.get(i);
			System.out.println(a);
			
			vo.setDataTagNo(a);
			
			courseDataroomDao.insertDataRoomFileTag(vo);
			System.out.println("one complete");
		}
		int count = 0 ; 
		return count;
	}
	
	
	public List<CourseDataroomVo> selectFileClickedByFolder(CourseDataroomVo vo){
		List<CourseDataroomVo> list = courseDataroomDao.selectFileClickedByFolder(vo);
		return list;
	}
	
	public List<CourseDataroomVo> selectFolderClickedByFolder(CourseDataroomVo vo){
		List<CourseDataroomVo> list = courseDataroomDao.selectFolderClickedByFolder(vo);
		return list;
	}
	
	
	public int selectFolderVo(int dataRoomNo) {
		int no = courseDataroomDao.selectFolderVo(dataRoomNo);
		return no;
	}
	
	
	//download
	public CourseDataroomVo downloadFile(CourseDataroomVo vo) {
		CourseDataroomVo vo2 = courseDataroomDao.downloadFile(vo);
		return vo2;
	}
	
	
	//폴더 삭제할때 안에 파일이나 폴더를 보고 삭제한다 
	public boolean deleteFolder(CourseDataroomVo vo) {
		if(courseDataroomDao.deleteBeforeCountFile(vo)==0&&courseDataroomDao.deleteBeforeCountFolder(vo)==0) {
			courseDataroomDao.deleteDataRoom(vo);
			return true;
		}
		return false;
	}
	
	//파일 삭제 
	public int deleteFile(CourseDataroomVo vo) {
		int count = courseDataroomDao.deleteFile(vo);
		return count; 
	}
	
	public CourseDataroomVo selectListAtFirst(CourseDataroomVo vo) {
		CourseDataroomVo vo2 = courseDataroomDao.selectListAtFirst(vo);
		return vo2;
	}
	
}
