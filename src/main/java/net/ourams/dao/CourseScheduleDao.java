package net.ourams.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.ourams.vo.AssignmentVo;
import net.ourams.vo.CourseScheduleVo;
import net.ourams.vo.PostVo;
import net.ourams.vo.ScheduleTagVo;
import net.ourams.vo.SubjectVo;

@Repository
public class CourseScheduleDao {

	@Autowired
	private SqlSession sqlSession;

	public List<CourseScheduleVo> loadSchedule(int courseNo) {
		return sqlSession.selectList("courseSchedule.loadSchedule", courseNo);
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

	public int deleteSchedule(CourseScheduleVo vo) {
		return sqlSession.delete("courseSchedule.deleteSchedule", vo);
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
}
