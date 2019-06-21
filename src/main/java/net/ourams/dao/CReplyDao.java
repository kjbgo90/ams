package net.ourams.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.ourams.vo.ReplyVo;

@Repository
public class CReplyDao {
	
	@Autowired
	private SqlSession sqlSession;

	public List<ReplyVo> selectreplyList(int cpostNo) {
		List<ReplyVo> replyList = sqlSession.selectList("creply.selectreplyList",cpostNo);
		System.out.println("DDDD");
		System.out.println(replyList.toString());
		return replyList;
	}

	public void insertReplyByReplyVo(ReplyVo registReplyVo) {
		sqlSession.insert("creply.insertReplyByReplyVo", registReplyVo);
	}

	public ReplyVo selectReplyByReplyNo(int reply) {
		return sqlSession.selectOne("creply.selectReplyByReplyNo", reply);
	}

	public int deleteReplyByReply(int reply) {
		return sqlSession.delete("creply.deleteReplyByReply", reply);
	}


}
