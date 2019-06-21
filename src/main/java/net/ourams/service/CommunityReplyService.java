package net.ourams.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.ourams.dao.CReplyDao;
import net.ourams.vo.ReplyVo;
import net.ourams.vo.UserVo;

@Service
public class CommunityReplyService {
	
	@Autowired
	private CReplyDao cReplyDao;


	public ReplyVo commentRegistAndGetReplyVo(UserVo authUser, int cpostNo, String replyContent) {
		ReplyVo registReplyVo = new ReplyVo();
		
		registReplyVo.setCpostNo(cpostNo);
		registReplyVo.setUserNo(authUser.getUserNo());
		registReplyVo.setCreplyContent(replyContent);
		
		cReplyDao.insertReplyByReplyVo(registReplyVo);
		
		return cReplyDao.selectReplyByReplyNo(registReplyVo.getCreplyno());
	}


	public int commentDelete(int reply) {
		return cReplyDao.deleteReplyByReply(reply);
	}


	public List<ReplyVo> getcreplyList(int cpostNo) {
		List<ReplyVo> replyList = cReplyDao.selectreplyList(cpostNo);
		System.out.println("SSS");
		System.out.println(replyList.toString());
		return replyList;
	}


}