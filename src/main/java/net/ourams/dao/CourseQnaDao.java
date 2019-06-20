package net.ourams.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.ourams.vo.PostVo;
import net.ourams.vo.SubjectVo;
import net.ourams.vo.fileUpLoadVo;

@Repository
public class CourseQnaDao {
	@Autowired
	private SqlSession sqlSession;
	
	//post 갯수 
	public int countPost() {
		int count = sqlSession.selectOne("qna.countPost");
		return count;
	}
	
	/* 글전체리스트 가져오기 기본*/
	public List<PostVo> selectListPaging(Map<String, Object> map){
		List<PostVo> list = sqlSession.selectList("qna.selectListPaging", map);
		System.out.println(list.toString());
		
		return list;
	}
	
	//검색하는 기능 페이징도 했음 
	public List<PostVo> searchList(Map<String, Object> map){
		List<PostVo> list = sqlSession.selectList("qna.searchList", map);
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
		return sqlSession.insert("qna.insert", postVo);
	}


	public List<PostVo> selectAll() {
		List<PostVo> list = sqlSession.selectList("qna.selectAll");
		return list;
	}

	/*과목리스트 가져오기*/
	public List<SubjectVo> selectsubjectAll(int courseNo) {
		List<SubjectVo> subjectlist = sqlSession.selectList("qna.selectSubjectAll",courseNo);
		System.out.println("DDDDAAAAOOOO");
		System.out.println(sqlSession.selectList("qna.selectSubjectAll",courseNo).toString());

		System.out.println(subjectlist.toString());
		return subjectlist;
	}

	/* 글 삭제 */
	public int delete(PostVo postVo) {
		return sqlSession.delete("qna.delete", postVo);
	}
	
	public int deletereply(PostVo postVo) {
		return sqlSession.delete("qna.deletereply", postVo);
	}
	
	public int countReply(PostVo postVo) {
		return sqlSession.selectOne("qna.countReply", postVo);
	}

	public int update(PostVo postVo) {
		return sqlSession.update("qna.update", postVo);
	}

	public int insertFile(fileUpLoadVo fileVo) {
		return sqlSession.insert("qna.insertFile", fileVo);		
	}

	public int insertPostFile(int postNo, int fileNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("postNo", postNo);
		map.put("fileNo", fileNo);
		
		return sqlSession.insert("qna.insertPostFile", map);
		
	}

	public List<fileUpLoadVo> selectFileListByPostNo(PostVo postVo) {
		return sqlSession.selectList("qna.selectFileListByPostNo", postVo);
	}
}
