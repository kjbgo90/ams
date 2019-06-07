package net.ourams.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.ourams.vo.CourseDataroomVo;

@Repository
public class CourseDataroomDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<CourseDataroomVo> selectFileList(){
		List<CourseDataroomVo> list = sqlSession.selectList("courseDataRoom.selectFolderList");
		return list;
	}
	
	
}
