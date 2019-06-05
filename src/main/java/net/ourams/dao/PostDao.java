package net.ourams.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.ourams.vo.PostVo;


@Repository
public class PostDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<PostVo> selectAll(int courseNo){
		return sqlSession.selectList("notice.selectAll",courseNo);
	}

	/*
	 * public int updateHit(int postNo) { return
	 * sqlSession.update("notice.updateHit", postNo); }
	 */
	
	
	public PostVo selectNotice(int postNo) {
		return sqlSession.selectOne("notice.selectNotice", postNo);
	}
	
}
