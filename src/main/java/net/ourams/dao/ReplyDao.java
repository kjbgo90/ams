package net.ourams.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDao {
	
	@Autowired
	private SqlSession sqlSession;
}
