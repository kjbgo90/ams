package net.ourams.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.ourams.vo.CommunityVo;
import net.ourams.vo.LocationVo;
import net.ourams.vo.fileUpLoadVo;

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
	
	public CommunityVo selectNotice(int cpostNo) {
		return sqlSession.selectOne("community.selectNotice", cpostNo);
	}

	public int registerPost(CommunityVo vo) {
		return sqlSession.insert("community.insertPost", vo);
	}
	
	public int registerLocation(CommunityVo vo) {
		return sqlSession.insert("community.insertLocation", vo);
	}
	
	public int registerLocationPost(Map<String, Object> map) {
		return sqlSession.insert("community.insertLocationPost", map);
	}
	
	public int registerFile(fileUpLoadVo vo) {
		return sqlSession.insert("community.insertFile", vo);
	}
	
	public int registerCommunityFile(Map<String,Object> map) {
		return sqlSession.insert("community.insertCommunityFile", map);
	}
	
	public LocationVo existLocation(String address) {
		return sqlSession.selectOne("community.selectLocation", address);
	}
}
