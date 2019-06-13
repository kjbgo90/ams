package net.ourams.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.ourams.dao.CourseDataroomDao;
import net.ourams.vo.CourseDataroomFileUploadVo;
import net.ourams.vo.CourseDataroomVo;

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
	
	public int fileUploadInDB(CourseDataroomFileUploadVo fileVo) {
		System.out.println("help me");
		
		CourseDataroomVo vo = new CourseDataroomVo();
		vo.setFileName(fileVo.getFileName());
		vo.setFilePath(fileVo.getFilePath());
		vo.setFileSize(fileVo.getFileSize());
		vo.setSaveName(fileVo.getSaveName());
		
		vo.setDataRoomNo(fileVo.getDataRoomNo());
		System.out.println(vo.toString());
		courseDataroomDao.insertFileUpLoad(vo);
		
		
		
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
	
}
