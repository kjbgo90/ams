package net.ourams.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.ourams.vo.PostVo;

@Repository
public class CourseQnaDao {
	@Autowired
	private SqlSession sqlSession;
	
	
	
	
	/* 글전체리스트 가져오기 기본*/
	public List<PostVo> selectAll(int courseNo){
		List<PostVo> list = sqlSession.selectList("qna.selectAll",courseNo);
		System.out.println(list.toString());
		
		return list;
	}


	public int updateHit(int postNo) {
		return sqlSession.update("qna.updateHit", postNo);
	}


	/* no로 글가져오기 */
	public PostVo selectNotice(int postNo) {
		return sqlSession.selectOne("qna.selectNotice", postNo);
	}

	/* 글저장 */
	public int insert(PostVo postVo) {
		return sqlSession.selectOne("qna.insert", postVo);
	}
}
