package net.ourams.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.ourams.vo.CourseScheduleVo;

@Repository
public class CourseScheduleDao {
	
	@Autowired 
	private SqlSession sqlSession;
	
	public List<CourseScheduleVo> loadSchedule(){
		return sqlSession.selectList("courseSchedule.loadSchedule");
	}
	
	public int registerSchedule(CourseScheduleVo vo){
		return sqlSession.insert("courseSchedule.registerSchedule", vo);
	}
}
