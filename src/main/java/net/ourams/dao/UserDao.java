package net.ourams.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.ourams.vo.UserVo;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;

	public UserVo selectAuthUser(String email, String password) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("password", password);
		
		return sqlSession.selectOne("user.selectAuthuser", map);
	}
	
	
}
