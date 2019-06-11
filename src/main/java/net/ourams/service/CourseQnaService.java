package net.ourams.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.ourams.dao.CourseQnaDao;
import net.ourams.vo.PostVo;

@Service
public class CourseQnaService {

	@Autowired
	private CourseQnaDao courseQnaDao;
	
	public List<PostVo> getList(int courseNo){
		List<PostVo> qnaList = courseQnaDao.selectAll(courseNo); 
		System.out.println(qnaList.toString());
		return qnaList;
	}
	/*
	 * public PostVo read(int postNo) { //PostDao.updateHit(postNo); PostVo PostVo =
	 * PostDao.selectNotice(postNo); return PostVo; }
	 * 
	 * public int write(PostVo postVo) {
	 * System.out.println("#########################");
	 * System.out.println(postVo.toString()); return PostDao.insert(postVo); }
	 * 
	 * public int delete(PostVo postVo) {
	 * System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2");
	 * System.out.println(postVo.toString()); return PostDao.delete(postVo); }
	 */

	public PostVo read(int postNo) {
		// TODO Auto-generated method stub
		courseQnaDao.updateHit(postNo); 
		PostVo PostVo = courseQnaDao.selectNotice(postNo); 
		return PostVo; 
	}

	public int write(PostVo postVo) {
		System.out.println("#########################");
		System.out.println(postVo.toString());
		return courseQnaDao.insert(postVo);		
	}

	
}
