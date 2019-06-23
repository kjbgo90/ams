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
	
	public List<CommunityVo> MainEatList() {
		return sqlSession.selectList("community.MainEatList");
	}
	public List<CommunityVo> MainList() {
		return sqlSession.selectList("community.MainList");
	}

	public List<CommunityVo> MaincafeList() {
		return sqlSession.selectList("community.MaincafeList");
	}
	
	public List<CommunityVo> communityList(int cpostType) {
		return sqlSession.selectList("community.selectList", cpostType);
	}
	
	public List<CommunityVo> likedList(int cpostType) {
		return sqlSession.selectList("community.selectLiked", cpostType);
	}
	
	public CommunityVo selectNotice(int cpostNo) {
		return sqlSession.selectOne("community.selectNotice", cpostNo);
	}

	public int updateliked(int cpostNo) {
		return sqlSession.update("community.updateliked", cpostNo);
	}
	
	public int updateunliked(int cpostNo) {
		return sqlSession.update("community.updateunliked", cpostNo);
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
	public int countReply(CommunityVo communityvo) {
		return sqlSession.selectOne("community.countReply", communityvo);
	}
	public int deletereply(CommunityVo communityvo) {
		return sqlSession.delete("community.deletereply", communityvo);
	}
	public int delete(CommunityVo communityvo) {
		return sqlSession.delete("community.delete", communityvo);
	}



}
