package net.ourams.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.ourams.vo.AssignmentVo;
import net.ourams.vo.CourseScheduleVo;
import net.ourams.vo.PostVo;
import net.ourams.vo.ScheduleTagVo;
import net.ourams.vo.SubjectVo;
import net.ourams.vo.UserVo;

@Repository
public class CourseScheduleDao {

	@Autowired
	private SqlSession sqlSession;

	public List<CourseScheduleVo> loadSchedule(int courseNo) {
		return sqlSession.selectList("courseSchedule.loadSchedule", courseNo);
	}
	
	public List<CourseScheduleVo> loadTodaySchedule(Map<String, Object> map){
		return sqlSession.selectList("courseSchedule.loadTodaySchedule", map);
	}
	
 	public List<CourseScheduleVo> loadCourseSchedule(CourseScheduleVo vo){
		return sqlSession.selectList("courseSchedule.loadCourseSchedule", vo);
	}

	public List<CourseScheduleVo> loadPersonalSchedule(CourseScheduleVo vo){
		return sqlSession.selectList("courseSchedule.loadPersonalSchedule", vo);
	}

	public List<Integer> loadTag(int courseNo) {
		return sqlSession.selectList("courseSchedule.loadTag", courseNo);
	}

	public int registerSchedule(CourseScheduleVo vo) {
		return sqlSession.insert("courseSchedule.registerSchedule", vo);
	}

	public int registerScheduleTag(ScheduleTagVo vo) {
		return sqlSession.insert("courseSchedule.registerScheduleTag", vo);
	}

	public CourseScheduleVo selectedSchedule(CourseScheduleVo vo) {
		return sqlSession.selectOne("courseSchedule.selectedSchedule", vo);
	}
	
	public List<CourseScheduleVo> searchSchedule(CourseScheduleVo vo){
		return sqlSession.selectList("courseSchedule.searchSchedule", vo);
	}
	
	public int modifySchedule(Map<String, Object> map) {
		return sqlSession.update("courseSchedule.modifySchedule", map);
	}
	
	public int deleteSchedule(CourseScheduleVo vo) {
		return sqlSession.delete("courseSchedule.deleteSchedule", vo);
	}

	public int deleteTag(CourseScheduleVo vo) {
		return sqlSession.delete("courseSchedule.deleteTag", vo);
	}
	
	public PostVo findNotice(CourseScheduleVo vo) {
		return sqlSession.selectOne("courseSchedule.findNotice", vo);
	}

	public AssignmentVo findAssignment(CourseScheduleVo vo) {
		return sqlSession.selectOne("courseSchedule.findAssignment", vo);
	}

	public SubjectVo findCourse(CourseScheduleVo vo) {
		return sqlSession.selectOne("courseSchedule.findCourse", vo);
	}
	
	public List<UserVo> findCourseUser(int courseNo) {
		return sqlSession.selectList("courseSchedule.findCourseUser", courseNo);
	}

	/*-----------------------------------------find one column-----------------------------------------*/

	// find courseNo
	public int findCourseNo(String coursePath) {
		return sqlSession.selectOne("courseSchedule.findCourseNo", coursePath);
	}

	// find courseName
	public String findCourseName(int courseNo) {
		return sqlSession.selectOne("courseSchedule.findCourseName", courseNo);
	}

	// find lecture roomNo
	public int findLecRoomNo(int courseNo) {
		return sqlSession.selectOne("courseSchedule.findLecRoomNo", courseNo);
	}

	public String findCoursePath(int courseNo) {
		return sqlSession.selectOne("courseSchedule.findCoursePath", courseNo);
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

	public String findWriter(int userNo) {
		return sqlSession.selectOne("courseSchedule.findWriter", userNo);
	}
	
	public String findEmail(String userNo) {
		return sqlSession.selectOne("courseSchedule.findEmail", userNo);
	}
}
