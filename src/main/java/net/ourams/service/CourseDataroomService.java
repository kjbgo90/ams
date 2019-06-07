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
		List<CourseDataroomVo> list = courseDataroomDao.selectFileList();
		return list;
	}
	
}
