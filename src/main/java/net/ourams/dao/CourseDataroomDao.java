package net.ourams.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.ourams.vo.CourseDataroomVo;

@Repository
public class CourseDataroomDao {

	@Autowired
	private SqlSession sqlSession;
	

	public int insertFolder(CourseDataroomVo vo) {
		System.out.println(vo.getCourseNo());
		System.out.println(vo.getpRoomNo());
		System.out.println(vo.getDataRoomName());
		int count = sqlSession.insert("courseDataRoom.insertFolder",vo);
		System.out.println(vo.getDataRoomNo());
		return count;
	}
	
	public List<CourseDataroomVo> selectTagList(){
		List<CourseDataroomVo> list = sqlSession.selectList("courseDataRoom.selectTagList");
		return list;
	}
	
	public int selectFolderVo(int dataRoomNo) {
		int no = sqlSession.selectOne("courseDataRoom.selectFolderVo", dataRoomNo);
		return no;
	}
	
	public List<CourseDataroomVo> getDataRoomRootList(CourseDataroomVo vo){
		List<CourseDataroomVo> list = sqlSession.selectList("courseDataRoom.selectRootFolderList", vo);
		return list;
	}
	
	public List<CourseDataroomVo> getDataRoomRoot(CourseDataroomVo vo){
		List<CourseDataroomVo> list = sqlSession.selectList("courseDataRoom.selectRootFolder", vo);
		return list;
	}
	
	public List<CourseDataroomVo> getDataTagList(CourseDataroomVo vo){
		List<CourseDataroomVo> list = sqlSession.selectList("courseDataRoom.SelectTagOnByDataTagNo", vo);
		return list;
	}

	public List<CourseDataroomVo> SelectTagOnByDataTagNo(CourseDataroomVo vo){
		List<CourseDataroomVo> list = sqlSession.selectList("courseDataRoom.SelectTagOnByDataTagNo", vo);
		return list;
	}
	
	
	public int insertFileUpLoad(CourseDataroomVo vo) {
		int count = sqlSession.insert("courseDataRoom.insertFileUpLoad",vo);
		System.out.println(vo.getFileNo());
		return count;
	}
	

	public int insertDataRoomFile(CourseDataroomVo vo) {
		int count = sqlSession.insert("courseDataRoom.insertDataRoomFile",vo);
		System.out.println(vo.getDataRoomFileNo());
		return count;
	}
	

	public int insertDataRoomFileTag(CourseDataroomVo vo) {
		int count = sqlSession.insert("courseDataRoom.insertDataRoomFileTag",vo);
		return count;
	}
	
	public List<CourseDataroomVo> selectFileClickedByFolder(CourseDataroomVo vo){
		List<CourseDataroomVo> list = sqlSession.selectList("courseDataRoom.selectFileClickedByFolder", vo);
		return list;
	}
	
	public List<CourseDataroomVo> selectFolderClickedByFolder(CourseDataroomVo vo){
		List<CourseDataroomVo> list = sqlSession.selectList("courseDataRoom.selectFolderClickedByFolder", vo);
		return list;
	}
	
	
	public CourseDataroomVo downloadFile(CourseDataroomVo vo) {
		CourseDataroomVo vo2 = sqlSession.selectOne("courseDataRoom.downloadFile", vo);
		return vo2;
	}
	
	
	
	//삭제하기전에 폴더안에 파일 데이터있는지 확인하기 
	public int deleteBeforeCountFile(CourseDataroomVo vo) {
		int count = sqlSession.selectOne("courseDataRoom.deleteBeforeCountFile", vo);
		return count;
	}
	

	
	//삭제하기전에 폴더안에 폴더 데이터있는지 확인하기 
	public int deleteBeforeCountFolder(CourseDataroomVo vo) {
		int count = sqlSession.selectOne("courseDataRoom.deleteBeforeCountFolder", vo);
		return count;
	}
	
	
	
	
	//폴더 삭제 
	public int deleteDataRoom(CourseDataroomVo vo) {
		int count = sqlSession.selectOne("courseDataRoom.deleteDataRoom", vo);
		return count;
	}
	
	
	//파일 삭제 
	public int deleteFile(CourseDataroomVo vo) {
		int count = sqlSession.selectOne("courseDataRoom.deleteFile", vo);
		return count;
	}
}
