package net.ourams.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.ourams.dao.CourseDataroomDao;
import net.ourams.vo.CourseDataroomVo;

@Service
public class CourseDataroomService {

	@Autowired
	private CourseDataroomDao courseDataroomDao;
	
	
	public List<CourseDataroomVo> getfileList(){
		CourseDataroomVo vo = new CourseDataroomVo();
		vo.setCourseNo(1);
		List<CourseDataroomVo> list = courseDataroomDao.selectFileList(vo);
		return list;
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
	
	public List<CourseDataroomVo> getDataTagList(CourseDataroomVo vo){
		vo.setCourseNo(1);
		List<CourseDataroomVo> list = courseDataroomDao.getDataTagList(vo);
		return list;
	}
	
	
	
}
