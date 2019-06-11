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
	
	public List<CourseDataroomVo> selectFileList(CourseDataroomVo courseDataroomVo){
		List<CourseDataroomVo> list = sqlSession.selectList("courseDataRoom.selectFileListAtFirst", courseDataroomVo);
		return list;
	}
	
	public List<CourseDataroomVo> selectTagList(){
		List<CourseDataroomVo> list = sqlSession.selectList("courseDataRoom.selectTagList");
		return list;
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
	
}
