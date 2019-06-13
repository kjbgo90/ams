package net.ourams.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.ourams.vo.ReplyVo;

@Repository
public class ReplyDao {
	
	@Autowired
	private SqlSession sqlSession;

	public List<ReplyVo> selectreplyList(int postNo) {
		List<ReplyVo> replyList = sqlSession.selectList("reply.selectreplyList",postNo);
		System.out.println("DDDD");
		System.out.println(replyList.toString());
		return replyList;
	}

	public void insertReplyByReplyVo(ReplyVo registReplyVo) {
		sqlSession.insert("reply.insertReplyByReplyVo", registReplyVo);
	}

	public ReplyVo selectReplyByReplyNo(int reply) {
		return sqlSession.selectOne("reply.selectReplyByReplyNo", reply);
	}

	public int deleteReplyByReply(int reply) {
		return sqlSession.delete("reply.deleteReplyByReply", reply);
	}


}
