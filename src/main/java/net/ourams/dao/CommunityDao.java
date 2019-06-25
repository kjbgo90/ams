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
	
	public List<CommunityVo> allList(){
		return sqlSession.selectList("community.selectAllList");
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
	
	public List<fileUpLoadVo> selectCommunityFileList(){
		return sqlSession.selectList("community.selectCommunityFileList");
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
	
	public List<CommunityVo> hotPlaces(int cpostType){
		return sqlSession.selectList("community.selectHotPlaces", cpostType);
	}
	
	public List<CommunityVo> myPost(CommunityVo vo){
		return sqlSession.selectList("community.selectMyPost", vo);
	}

	public int loadLocationNo(CommunityVo vo){
		return sqlSession.selectOne("community.selectLocationNo", vo);
	}
	
	public String loadBuisnessName(CommunityVo vo) {
		return sqlSession.selectOne("community.selectBusinessName", vo);
	}
	
	public String loadAddress(CommunityVo vo) {
		return sqlSession.selectOne("community.selectAddress", vo);
	}
	
	public String loadLatitude(CommunityVo vo) {
		return sqlSession.selectOne("community.selectLatitude", vo);
	}
	
	public String loadLongitude(CommunityVo vo) {
		return sqlSession.selectOne("community.selectLongitude", vo);
	}
	
	/* 글전체리스트 가져오기 기본*/
	public List<CommunityVo> selectPagingList(Map<String, Object> map){
		List<CommunityVo> list = sqlSession.selectList("community.selectPagingList", map);
		System.out.println(list.toString());
		
		return list;
	}
	
	// count 	
	public int totalPostNumber(int cpostType) {
		int count = sqlSession.selectOne("community.totalPostNumber", cpostType);
		return count;
	}
	
	public int countReply(CommunityVo communityvo) {
		return sqlSession.selectOne("community.countReply", communityvo);
	}
	
	public int deletereply(CommunityVo communityvo) {
		return sqlSession.delete("community.deletereply", communityvo);
	}
	
	public int deleteLocationPost(CommunityVo communityvo) {
		return sqlSession.delete("community.deleteLocationPost", communityvo);
	}
	
	public int deleteCommunityFile(CommunityVo communityvo) {
		return sqlSession.delete("community.deleteCommunityFile", communityvo);
	}
	
	public int delete(CommunityVo communityvo) {
		return sqlSession.delete("community.delete", communityvo);
	}



}
