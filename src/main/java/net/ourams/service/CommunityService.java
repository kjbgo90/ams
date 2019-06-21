package net.ourams.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.ourams.dao.CReplyDao;
import net.ourams.dao.CommunityDao;
import net.ourams.vo.CommunityVo;
import net.ourams.vo.PostVo;
import net.ourams.vo.ReplyVo;

@Service
public class CommunityService {
	@Autowired
	private CommunityDao communityDao;


	public List<CommunityVo> getList() {
		List<CommunityVo> list=communityDao.communityList();	
		return list;
	}
	
	
	public List<CommunityVo> getlikedList(){
		List<CommunityVo> likedlist=communityDao.likedList();	
		return likedlist;
	}


	public CommunityVo read(int cpostNo) {
		CommunityVo communityVo = communityDao.selectNotice(cpostNo);
		return communityVo;
	}


}
