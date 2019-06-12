package net.ourams.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.ourams.dao.ReplyDao;
import net.ourams.vo.ReplyVo;

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


}