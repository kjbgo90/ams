package net.ourams.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import net.ourams.vo.AssignmentVo;
import net.ourams.vo.ChapterVo;
import net.ourams.vo.CourseVo;
import net.ourams.vo.SubjectVo;
import net.ourams.vo.SubmitVo;
import net.ourams.vo.TimelineVo;
import net.ourams.vo.UserVo;
import net.ourams.vo.fileUpLoadVo;

@Repository
public class CourseAssignmentDao {

	@Autowired
	private SqlSession sqlSession;
	
	/* 전체 과제 리스트 */
	public List<AssignmentVo> selectList(int courseNo) {
		return sqlSession.selectList("assignment.selectList", courseNo);
	}

	public List<SubjectVo> selectSubList(int courseNo) {
		return sqlSession.selectList("course.selectSubjectListByCourseNo", courseNo);
	}

	public int insertSubmit(SubmitVo submitVo) {
		return sqlSession.insert("assignment.insertSubmit", submitVo);
	}

	public List<SubmitVo> selectSubmitList(int assignmentNo) {
		return sqlSession.selectList("assignment.selectSubmitList", assignmentNo);
	}

	public SubmitVo selectSubmitBySubmitNo(int submitNo) {
		return sqlSession.selectOne("assignment.selectSubmitBySubmitNo", submitNo);
	}

	@Transactional
	public int deleteSubmit(int submitNo) {
		sqlSession.delete("assignment.deleteSubmitFile", submitNo);
		return sqlSession.delete("assignment.deleteSubmit", submitNo);
	}

	public AssignmentVo selectAssignmentByAssignmentNo(int assignmentNo) {
		return sqlSession.selectOne("assignment.selectAssignmentByAssignmentNo",assignmentNo);
	}

	public List<ChapterVo> selectChapterList() {
		return sqlSession.selectList("assignment.selectChapterList");
	}

	public List<ChapterVo> selectChapterListBySubjectNo(int subjectNo) {
		return sqlSession.selectList("assignment.selectChapterListBySubjectNo", subjectNo);
	}

	public int insertAssignment(AssignmentVo assignmentVo) {
		return sqlSession.insert("assignment.insertAssignment", assignmentVo);
	}

	public int insertAssignmentSchedule(AssignmentVo assignmentVo) {
		return sqlSession.insert("assignment.insertAssignmentSchedule", assignmentVo);
	}

	public int insertFile(fileUpLoadVo fileVo) {
		return sqlSession.insert("assignment.insertFile", fileVo);
	}

	public int insertAssignmentFile(int assignmentNo, int fileNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("assignmentNo", assignmentNo);
		map.put("fileNo", fileNo);
		
		return sqlSession.insert("assignment.insertAssignmentFile", map);
	}

	public List<fileUpLoadVo> selectAssignmentFileList() {
		return sqlSession.selectList("assignment.selectAssignmentFileList");
	}

	public int insertSubmitFile(int submitNo, int fileNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("submitNo", submitNo);
		map.put("fileNo", fileNo);
		
		return sqlSession.insert("assignment.insertSubmitFile", map);
	}

	public List<fileUpLoadVo> selectSubmitFileList() {
		return sqlSession.selectList("assignment.selectSubmitFileList");
	}

	public int countSubmittedAssign(SubmitVo submitVo) {
		return sqlSession.selectOne("assignment.countSubmittedAssign", submitVo);
	}

	public int updateAssignmentSchedule(AssignmentVo assignmentVo) {
		return sqlSession.update("assignment.updateAssignmentSchedule", assignmentVo);
	}

	public int updateAssignment(AssignmentVo assignmentVo) {
		return sqlSession.update("assignment.updateAssignment", assignmentVo);
	}

	public int deleteAssignmentFile(AssignmentVo assignmentVo) {
		return sqlSession.delete("assignment.deleteAssignmentFile", assignmentVo);
	}

	public int updateSubmitScore(SubmitVo submitVo) {
		return sqlSession.update("assignment.updateSubmitScore", submitVo);
	}

	public List<fileUpLoadVo> selectFileListByAssignmentNo(AssignmentVo assignmentVo) {
		return sqlSession.selectList("assignment.selectFileListByAssignmentNo", assignmentVo);
	}
	

	

	//timeline insert 문 
	public int insertTimeline(TimelineVo vo) {
		sqlSession.insert("notice.insertTimeline", vo);
		int count = vo.getTimeLineNo();
		return count;
	}
	
	//timelineuser insert 문 
	public int insertTimelineUser(TimelineVo vo) {
		int count = sqlSession.insert("notice.insertTimelineUser", vo);
		return count;
	}
	
	//timeline
	public CourseVo selectCoursePath(CourseVo vo) {
		CourseVo vo2 = sqlSession.selectOne("notice.selectCoursePath", vo);
		return vo2;
	}
	

	public List<UserVo> selectListbyCoursePath(CourseVo vo) {
		System.out.println(vo.toString());
		List<UserVo> list = sqlSession.selectList("notice.selectListcourse", vo);
		return list;
	}

	public SubmitVo selectSubmitByUserNo(int assignmentNo, int userNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("assignmentNo", assignmentNo);
		map.put("userNo", userNo);
		return sqlSession.selectOne("assignment.selectSubmitByUserNo", map);
	}

	public List<CourseVo> selectCourseListByUserNo(int userNo) {
		return sqlSession.selectList("assignment.selectCourseListByUserNo", userNo);
	}
	
	public List<AssignmentVo> selectAssignmentListByTeacherNo(int userNo) {
	      return sqlSession.selectList("assignment.selectAssignmentListByTeacherNo", userNo);
	   }

	public List<SubmitVo> selectSubmitListByUserNo(int userNo) {
	      return sqlSession.selectList("assignment.selectSubmitListByUserNo", userNo);
	   }
}
