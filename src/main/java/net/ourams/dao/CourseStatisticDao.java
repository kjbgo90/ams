package net.ourams.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.ourams.vo.AssignmentVo;
import net.ourams.vo.FeedbackQuestionVo;
import net.ourams.vo.StatisticVo;
import net.ourams.vo.SubjectVo;
import net.ourams.vo.SubmitVo;
import net.ourams.vo.UserVo;


@Repository
public class CourseStatisticDao {

	@Autowired
	private SqlSession sqlSession;

	public List<UserVo> selectUserListByCourseNo(int courseNo) {
		return sqlSession.selectList("statistic.selectUserListByCourseNo", courseNo);
	}

	public List<AssignmentVo> selectAssignmentListByCourseNo(int courseNo) {
		return sqlSession.selectList("statistic.selectAssignmentListByCourseNo", courseNo);
	}

	public StatisticVo selectSubmitCountByAssignmentNo(int assignmentNo) {
		return sqlSession.selectOne("statistic.selectSubmitCountByAssignmentNo", assignmentNo);
	}

	public List<FeedbackQuestionVo> selectFeedbackQuestionList(int courseNo) {
		return sqlSession.selectList("statistic.selectFeedbackQuestionList", courseNo);
	}

	public StatisticVo selectFeedbackAnswer(int fbqNo) {
		return sqlSession.selectOne("statistic.selectFeedbackAnswer", fbqNo);
	}

	public List<SubjectVo> selectSubjectList(int courseNo) {
		return sqlSession.selectList("statistic.selectSubjectList", courseNo);
	}

	public StatisticVo selectQnA(int subjectNo) {
		return sqlSession.selectOne("statistic.selectQnA", subjectNo);
	}

	public SubmitVo selectSubmitByUserNo(int assignmentNo, int userNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("assignmentNo", assignmentNo);
		map.put("userNo", userNo);
		
		return sqlSession.selectOne("statistic.selectSubmitByUserNo", map);
	}

	
}
