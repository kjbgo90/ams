package net.ourams.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.ourams.dao.CommunityDao;
import net.ourams.vo.CommunityVo;
import net.ourams.vo.LocationVo;
import net.ourams.vo.UserVo;
import net.ourams.vo.fileUpLoadVo;

@Service
public class CommunityService {
	@Autowired
	private CommunityDao communityDao;
	
	
	
	public List<CommunityVo> getMainEatList() {
		List<CommunityVo> eatlist =communityDao.MainEatList();	
		return eatlist;
	}
	public List<CommunityVo> getMaincafeList() {
		List<CommunityVo> cafelist=communityDao.MaincafeList();	
		return cafelist;
	}

	
	public List<CommunityVo> getMainList() {
		List<CommunityVo> mainlist=communityDao.MainList();	
		return mainlist;
	}
	
	public List<CommunityVo> getList(int cpostType) {
		List<CommunityVo> list=communityDao.communityList(cpostType);	
		return list;
	}
	
	
	public List<CommunityVo> getlikedList(int cpostType){
		List<CommunityVo> likedlist=communityDao.likedList(cpostType);	
		return likedlist;
	}


	public CommunityVo read(int cpostNo) {
		CommunityVo communityVo = communityDao.selectNotice(cpostNo);
		return communityVo;
	}
	
	public int updateliked(int cpostNo) {
		int count = communityDao.updateliked(cpostNo);
		return count;
	}

	public int updateunliked(int cpostNo) {
		int count= communityDao.updateunliked(cpostNo);
		return count;
	}
	
	@Transactional
	public int registerPost(UserVo authUser, CommunityVo vo) {
		vo.setUserNo(authUser.getUserNo());
		
		int locationNo;
		int cpostNo;
		int fileNo;
		List<fileUpLoadVo> fuList;
		
		LocationVo LV = communityDao.existLocation(vo.getAddress());
		
		if(LV == null){
			communityDao.registerLocation(vo);
			locationNo  = vo.getLocationNo();
			System.out.println("success to register location...");
			communityDao.registerPost(vo);
			cpostNo = vo.getCpostNo();
		}else {
			locationNo = LV.getLocationNo();
			System.out.println("already exist location...");
			int result = communityDao.registerPost(vo);
			cpostNo = vo.getCpostNo();
		}
		System.out.println("success to register post...");
		
		fuList = vo.getFileList();
		
		for(int i=0; i<fuList.size(); i++) {
			communityDao.registerFile(fuList.get(i));
			fileNo = fuList.get(i).getFileNo();
			System.out.println("success to register File...");
			
			Map<String, Object> cFileMap = new HashMap<String, Object>();
			cFileMap.put("cpostNo", cpostNo);
			cFileMap.put("fileNo", fileNo);
			
			System.out.println(cFileMap);
			communityDao.registerCommunityFile(cFileMap);
			System.out.println("success to register community file...");
		}
		

		Map<String, Object> lPostMap = new HashMap<String, Object>();
		lPostMap.put("locationNo", locationNo);
		lPostMap.put("cpostNo", cpostNo);
		
		return communityDao.registerLocationPost(lPostMap);
		
	}
	public int delete(CommunityVo communityvo) {
		System.out.println(communityvo.toString());
		int countReply = communityDao.countReply(communityvo);
		System.out.println(countReply);
		if(countReply != 0) {
		int count1 = communityDao.deletereply(communityvo);
		System.out.println(count1);
		}
		int count2 = communityDao.delete(communityvo);
		System.out.println(count2);
		return 0;
	}



}
