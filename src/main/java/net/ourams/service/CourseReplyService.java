package net.ourams.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.ourams.dao.ReplyDao;
import net.ourams.vo.ReplyVo;
import net.ourams.vo.UserVo;

@Service
public class CourseReplyService {
	
	@Autowired
	private ReplyDao replyDao;


	public List<ReplyVo> getreplyList(int postNo) {
		List<ReplyVo> replyList = replyDao.selectreplyList(postNo);
		System.out.println("SSS");
		System.out.println(replyList.toString());
		return replyList;
	}


	public ReplyVo commentRegistAndGetReplyVo(UserVo authUser, int postNo, String replyContent) {
		ReplyVo registReplyVo = new ReplyVo();
		
		registReplyVo.setPostNo(postNo);
		registReplyVo.setUserNo(authUser.getUserNo());
		registReplyVo.setReplyContent(replyContent);
		
		replyDao.insertReplyByReplyVo(registReplyVo);
		
		return replyDao.selectReplyByReplyNo(registReplyVo.getReply());
	}


	public int commentDelete(int reply) {
		return replyDao.deleteReplyByReply(reply);
	}


}