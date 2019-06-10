package net.ourams.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.ourams.vo.PostVo;


@Repository
public class PostDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<PostVo> selectAll(int courseNo){
		List<PostVo> list = sqlSession.selectList("notice.selectAll",courseNo);
		System.out.println(list.toString());
		
		return list;
	}

	/*
	 * public int updateHit(int postNo) { return
	 * sqlSession.update("notice.updateHit", postNo); }
	 */
	
	
	public PostVo selectNotice(int postNo) {
		return sqlSession.selectOne("notice.selectNotice", postNo);
	}

	public int insert(PostVo postVo) {
		return sqlSession.insert("notice.insert",postVo);
	}
	
}
