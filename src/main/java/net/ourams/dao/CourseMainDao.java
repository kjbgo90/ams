package net.ourams.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.ourams.vo.CourseRegistVo;
import net.ourams.vo.CourseVo;

@Repository
public class CourseMainDao {

	@Autowired
	private SqlSession sqlSession;

	public CourseVo selectCourseVoByCoursePath(String coursePath) {
		return sqlSession.selectOne("course.selectCourseByPath", coursePath);
	}

	public boolean selectCourseRegistExist(int courseNo, int userNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("courseNo", courseNo);
		map.put("userNo", userNo);
		
		CourseRegistVo courseRegistVo =  sqlSession.selectOne("course.selectCourseRegist", map);
		
		if(courseRegistVo == null) {
			return false;
		} 
		else {
			return true;
		}
	}
	
}
