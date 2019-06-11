package net.ourams.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.ourams.vo.ChapterVo;
import net.ourams.vo.CourseRegistVo;
import net.ourams.vo.CourseVo;
import net.ourams.vo.SubjectVo;
import net.ourams.vo.UserVo;

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

		CourseRegistVo courseRegistVo = sqlSession.selectOne("course.selectCourseRegist", map);

		if (courseRegistVo == null) {
			return false;
		} else {
			return true;
		}
	}

	public List<SubjectVo> selectSubjectList(int courseNo) {
		return sqlSession.selectList("course.selectSubjectListPlusDateByCourseNo", courseNo);
	}

	public List<ChapterVo> selectChapterList(int subjectNo) {
		return sqlSession.selectList("course.selectChapterListBysubjectNo", subjectNo);
	}

	public void editChapterByChapterNo(int chapterNo, String chapterContent) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("chapterNo", chapterNo);
		map.put("chapterContent", chapterContent);
		
		sqlSession.update("course.updateChapterByChapterNo", map);
	}

	public ChapterVo selectChapterByChapterNo(int chapterNo) {
		return sqlSession.selectOne("course.selectChapterByChapterNo", chapterNo);
	}

	public void editSubjectBySubjectVo(SubjectVo subjectVo) {
		sqlSession.update("course.updateSubjectBySubjectVo", subjectVo);
		sqlSession.update("course.updateScheduleBySubjectVo", subjectVo);
	}

	public SubjectVo selectSubjectBySubjectNo(int subjectNo) {
		return sqlSession.selectOne("course.selectSubjectBySubjectNo", subjectNo);
	}

	public void insertScheduleBySubjectVo(SubjectVo subjectVo) {
		sqlSession.insert("course.insertScheduleBySubjectVo", subjectVo);
		sqlSession.insert("course.insertSubjectBySubjectVo", subjectVo);
	}

	public int insertChapter(ChapterVo chapterVo) {
		return sqlSession.insert("course.insertChapterByChapterVo", chapterVo);
	}

	public void deleteScheduleByScheduleNo(int scheduleNo) {
		sqlSession.delete("course.deleteScheduleByScheduleNo", scheduleNo);
		
	}

	public void deleteSubjectBySubjectNo(int subjectNo) {
		sqlSession.delete("course.deleteSubjectBySubjectNo", subjectNo);
	}

	public void deleteChapterBySubjectNo(int subjectNo) {
		sqlSession.delete("course.deleteChapterBySubjectNo", subjectNo);
	}

	public int deleteChapterByChapterNo(int chapterNo) {
		return sqlSession.delete("course.deleteChapterByChapterNo", chapterNo);
	}

	public List<UserVo> selectUserListByCourseNo(int courseNo) {
		return sqlSession.selectList("course.selectUserListByCourseNo", courseNo);
	}

	public int updateCourseRegist(int userNo, int courseNo, int seatNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", userNo);
		map.put("courseNo", courseNo);
		map.put("seatNo", seatNo);
		
		return sqlSession.update("course.updateCourseregistByMap", map);
	}

	
}
