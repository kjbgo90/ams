package net.ourams.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.ourams.vo.CommunityVo;

@Repository
public class CommunityDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<CommunityVo> communityList() {
		return sqlSession.selectList("community.selectList");
	}
	
	public List<CommunityVo> likedList() {
		return sqlSession.selectList("community.selectLiked");
	}
}
