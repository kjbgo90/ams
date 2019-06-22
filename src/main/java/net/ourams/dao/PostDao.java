package net.ourams.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.ourams.vo.CourseVo;
import net.ourams.vo.PostVo;
import net.ourams.vo.TimelineVo;
import net.ourams.vo.UserVo;
import net.ourams.vo.fileUpLoadVo;


@Repository
public class PostDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	/* 글전체리스트 가져오기 기본*/
	public List<PostVo> selectPaging(Map<String, Object> map){
		List<PostVo> list = sqlSession.selectList("notice.selectListPaging",map);
		System.out.println(list.toString());
		
		return list;
	}
	
	
	//검색 기능 페이징 함 
	public List<PostVo> searchList(Map<String, Object> map){
		List<PostVo> list = sqlSession.selectList("notice.searchList", map);
		return list;
	}
	
	public int countPost() {
		int count = sqlSession.selectOne("notice.countPost");
		return count;
	}
	
	/* no로 글가져오기 */
	public PostVo selectNotice(int postNo) {
		return sqlSession.selectOne("notice.selectNotice", postNo);
	}
	
	/* 글저장 */
	public int insert(PostVo postVo) {
		return sqlSession.insert("notice.insert",postVo);
	}
	
	/* 글 삭제 */
	public int delete(PostVo postVo) {
		return sqlSession.delete("notice.delete", postVo);
	}

	public int update(PostVo postVo) {
		return sqlSession.update("notice.update", postVo);
	}


	public int updateHit(int postNo) {
		return sqlSession.update("notice.updateHit", postNo);
	}

	public int insertSchedule(PostVo postVo) {
		return sqlSession.insert("notice.insertSchedule", postVo);
	}

	public int insertSchedulePost(PostVo postVo) {
		return sqlSession.insert("notice.insertSchedulePost", postVo);
	}

	public List<fileUpLoadVo> selectFileListByPostNo(PostVo postVo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("notice.selectFileListByPostNo", postVo);
	}

	public int insertFile(fileUpLoadVo fileVo) {
		return sqlSession.insert("notice.insertFile", fileVo);			
	}

	public int insertPostFile(int postNo, int fileNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("postNo", postNo);
		map.put("fileNo", fileNo);
		
		return sqlSession.insert("notice.insertPostFile", map);		
	}

	

	//timeline
	public int insertTimeline(TimelineVo vo) {
		sqlSession.insert("notice.insertTimeline", vo);
		int count = vo.getTimeLineNo();
		return count;
	}
	
	//timeline
	public int insertTimelineUser(TimelineVo vo) {
		int count = sqlSession.insert("notice.insertTimelineUser", vo);
		return count;
	}
	
	//timeline
	public CourseVo selectCoursePath(CourseVo vo) {
		CourseVo vo2 = sqlSession.selectOne("notice.selectCoursePath", vo);
		return vo2;
	}
	

	public List<UserVo> selectListbyCoursePath(CourseVo vo) {
		System.out.println(vo.toString());
		List<UserVo> list = sqlSession.selectList("notice.selectListcourse", vo);
		return list;
	}
	
}
