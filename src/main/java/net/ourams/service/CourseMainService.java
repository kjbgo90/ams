package net.ourams.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.ourams.dao.CourseMainDao;
import net.ourams.vo.CourseVo;

@Service
public class CourseMainService {

	@Autowired
	private CourseMainDao courseMDao;
	
	/*  */
	public boolean checkService(String coursePath, int userNo) {
		
		//코스 패스에 해당하는 코스의 정보를 가져옴 
		CourseVo courseVo = courseMDao.selectCourseVoByCoursePath(coursePath);
		
		//코스 패스에 해당하는 코스가 없으면 false 리턴
		if(courseVo == null) {
			return false;
		}
		
		//로그인한 유저가 해당 코스의 강사면 true 리턴
		if(userNo == courseVo.getTeacherNo()) {
			return true;
		}
		
		int courseNo = courseVo.getCourseNo();
		
		boolean result = courseMDao.selectCourseRegistExist(courseNo, userNo);
		
		return result;
	}

	
}