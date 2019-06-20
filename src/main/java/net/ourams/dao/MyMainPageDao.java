package net.ourams.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.ourams.vo.MyPageVo;
import net.ourams.vo.PostVo;

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
	public List<PostVo> selectPost(PostVo vo){
		List<PostVo> list = sqlSession.selectList("myPage.secectPost", vo);
		return list;
	}
}
