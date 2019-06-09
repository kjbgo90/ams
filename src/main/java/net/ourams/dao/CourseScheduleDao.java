package net.ourams.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.ourams.vo.AssignmentVo;
import net.ourams.vo.CourseScheduleVo;
import net.ourams.vo.CourseVo;
import net.ourams.vo.PostVo;

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
	
	public CourseScheduleVo selectedSchedule(CourseScheduleVo vo) {
		return sqlSession.selectOne("courseSchedule.selectedSchedule", vo);
	}
	
	public PostVo findNotice(CourseScheduleVo vo) {
		return sqlSession.selectOne("courseSchedule.findNotice", vo);
	}
	
	public AssignmentVo findAssignment(CourseScheduleVo vo) {
		return sqlSession.selectOne("courseSchedule.findAssignment", vo);
	}
	
	public CourseVo findCourse(CourseScheduleVo vo) {
		return sqlSession.selectOne("courseSchedule.findCourse", vo);
	}
	
	/*-----------------------------------------find one column-----------------------------------------*/
	
	public String findCourseName(int courseNo) {
		return sqlSession.selectOne("courseSchedule.findCourseName", courseNo);
	}
	
	public String findSubjectTitle(int subjectNo) {
		return sqlSession.selectOne("courseSchedule.findSubjectTitle", subjectNo);
	}
	
	public String findChapterContent(int chapterNo) {
		return sqlSession.selectOne("courseSchedule.findChapterContent", chapterNo);
	}
	
	public String findTeacherName(int teacherNo) {
		return sqlSession.selectOne("courseSchedule.findTeacherName", teacherNo);
	}
}
