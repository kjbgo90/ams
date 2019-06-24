package net.ourams.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.ourams.vo.ChapterVo;
import net.ourams.vo.CourseDataroomVo;
import net.ourams.vo.CourseRegistVo;
import net.ourams.vo.CourseVo;
import net.ourams.vo.FeedbackAnswerVo;
import net.ourams.vo.FeedbackQuestionVo;
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

	public UserVo selectUserVoByUserNo(int userNo) {
		return sqlSession.selectOne("course.selectUserVoByUserNo", userNo);
	}

	public int updateEnterUser(int courseNo, int userNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("courseNo", courseNo);
		map.put("userNo", userNo);
		
		return sqlSession.update("course.updateCourseregistAccessStatTo1ByMap", map);
	}
	
	public int updateExitUser(int courseNo, int userNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("courseNo", courseNo);
		map.put("userNo", userNo);
		
		return sqlSession.update("course.updateCourseregistAccessStatTo0ByMap", map);
	}

	public SubjectVo selectNowSubjectVoByCourseNo(int courseNo) {
		return sqlSession.selectOne("course.selectNowSubjectVoByCourseNo", courseNo);
	}

	public int selectUserCountByCourseNo(int courseNo) {
		return sqlSession.selectOne("course.selectUserCountByCourseNo", courseNo);
	}

	public int insertFbqByFbqVo(FeedbackQuestionVo fbqVo) {
		return sqlSession.insert("course.insertFbqByFbqVo", fbqVo);
	}

	public List<UserVo> selectUserListByCourseNoAndAccessStat0(int courseNo) {
		return sqlSession.selectList("course.selectUserListByCourseNoAndAccessStat0", courseNo);
	}

	public int insertFbaByFbqNo(int fbqNo, List<UserVo> userList) {
		int result = 0;
		FeedbackAnswerVo fbaVo = new FeedbackAnswerVo();
		fbaVo.setFbqNo(fbqNo);
		
		for(int i = 0; i < userList.size(); i++) {
			fbaVo.setUserNo(userList.get(i).getUserNo());
			result += sqlSession.insert("course.insertFbaByFbqNo", fbaVo);
		}
		
		return result;
	}

	public List<FeedbackAnswerVo> getFbaListByFbqNo(int fbqNo) {
		return sqlSession.selectList("course.selectFbaListByFbqNo", fbqNo);
	}

	public int updateFbaAbsenseUsers(int fbqNo, List<UserVo> absenseUserList) {
		int result = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fbqNo", fbqNo);
		
		
		for(int i = 0; i < absenseUserList.size(); i++) {
			map.put("userNo", absenseUserList.get(i).getUserNo());
			result += sqlSession.update("course.updateFbaAbsenseUsers", map);
		}
		
		return result;
	}

	public List<UserVo> selectUserListByCourseNoAndUserType(int courseNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("course.selectUserListByCourseNoAndUserType", courseNo);
	}

	public int updateFbaAndFbqByFbaVo(FeedbackAnswerVo fbaVo) {
		sqlSession.update("course.updateFbaTypeByFbaVo", fbaVo);
		
		return sqlSession.update("course.updateFbqPercentByFbaVo", fbaVo);
	}

	public double selectFbqPercentByFbqNo(int fbqNo) {
		return sqlSession.selectOne("course.selectFbqPercentByFbqNo", fbqNo);
	}

	public List<CourseVo> selectCourseListByUserNo(int userNo) {
		return sqlSession.selectList("user.selectCourseListByUserNo", userNo);
	}

	public List<CourseVo> selectCourseListByUserNoAndUserType(int userNo, int userType) {
		
		return sqlSession.selectList("user.selectCourseListByUserNoAndUserType", userNo);
	}

	public int insertCourseByCourseVo(CourseVo createCourseVo) {
		return sqlSession.insert("course.insertCourseByCourseVo", createCourseVo);
	}

	public int insertCourseregistByCourseRegistVo(CourseRegistVo crVo) {
		return sqlSession.insert("course.insertCourseregistByCourseRegistVo", crVo);
	}

	public void insertDataroomByDataroomVo(CourseDataroomVo drVo) {
		sqlSession.insert("course.insertDataroomByDataroomVo", drVo);
	}

}
