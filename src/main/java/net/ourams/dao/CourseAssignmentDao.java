package net.ourams.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.ourams.vo.AssignmentVo;

@Repository
public class CourseAssignmentDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<AssignmentVo> selectList(int courseNo) {
		return sqlSession.selectList("assignment.selectList", courseNo);
	}

}
