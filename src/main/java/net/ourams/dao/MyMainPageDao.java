package net.ourams.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.ourams.vo.CourseVo;
import net.ourams.vo.MyPageVo;
import net.ourams.vo.PostVo;
import net.ourams.vo.SubmitVo;
import net.ourams.vo.TimelineVo;
import net.ourams.vo.UserVo;

@Repository
public class MyMainPageDao {

	@Autowired
	private SqlSession sqlSession;

	// 수강하고 있는 클래스들을 보여줄 거시다
	public List<MyPageVo> courseList(MyPageVo vo) {
		List<MyPageVo> list = sqlSession.selectList("myPage.secectCourse", vo);
		return list;
	}
	
	//posttype=? -> notice qna
	public List<PostVo> selectNotice(PostVo vo){
		List<PostVo> list = sqlSession.selectList("myPage.selectNotice", vo);
		return list;
	}
	
	//posttype=? -> notice qna
	public List<PostVo> selectQna(PostVo vo){
		List<PostVo> list = sqlSession.selectList("myPage.selectQna", vo);
		return list;
	}
	
	//posttype=? -> notice qna
		public List<PostVo> selectQnaAllList(PostVo vo){
			List<PostVo> list = sqlSession.selectList("myPage.selectQnaAllList", vo);
			return list;
		}
	
	public PostVo selectCoursePath(PostVo vo1) {
		PostVo vo = sqlSession.selectOne("myPage.selectCoursePath", vo1);
		return vo;
	}
	
	public List<TimelineVo> selectTimelineList(TimelineVo vo){
		List<TimelineVo> list = sqlSession.selectList("myPage.selectTimelineList", vo);
		return list;
	}
	
	

	public List<TimelineVo> selectTimelineAllList(TimelineVo vo){
		List<TimelineVo> list = sqlSession.selectList("myPage.selectTimelineAllList", vo);
		return list;
	}
	
	public List<SubmitVo> selectAssignmentAllList(SubmitVo vo){
		List<SubmitVo> list = sqlSession.selectList("myPage.selectAssignmentAllList", vo);
		return list;
	}
	
	public List<Integer> courseNoList(int userNo){
		List<Integer> list = sqlSession.selectList("myPage.courseNoList", userNo);
		return list;
	}
	
	public int updateUser(UserVo vo) {
		return sqlSession.update("myPage.updateUser", vo);
	}
	
}
