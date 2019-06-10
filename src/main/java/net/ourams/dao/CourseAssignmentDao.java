package net.ourams.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.ourams.vo.AssignmentVo;
import net.ourams.vo.ChapterVo;
import net.ourams.vo.SubjectVo;
import net.ourams.vo.SubmitVo;

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

	public int deleteSubmit(int submitNo) {
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

}
