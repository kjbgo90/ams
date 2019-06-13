package net.ourams.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.ourams.dao.CourseQnaDao;
import net.ourams.vo.PostVo;
import net.ourams.vo.SubjectVo;

@Service
public class CourseQnaService {

	@Autowired
	private CourseQnaDao courseQnaDao;
	
	public List<PostVo> getList(int courseNo){
		List<PostVo> qnaList = courseQnaDao.selectAll(courseNo); 
		System.out.println(qnaList.toString());
		return qnaList;
	}

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

	public List<SubjectVo> getsubjectList(int courseNo) {
		List<SubjectVo> subjectList = courseQnaDao.selectsubjectAll(courseNo);
		System.out.println("SSSSVVVICCCEE");
		System.out.println(subjectList.toString());
		return subjectList;
	}

	public int delete(PostVo postVo) {
		System.out.println(postVo.toString());
		return courseQnaDao.delete(postVo);
	}

	public PostVo modifyform(int postNo) {
		PostVo postVo = courseQnaDao.selectNotice(postNo);
		return postVo;
	}

	public int modify(PostVo postVo) {
		return courseQnaDao.update(postVo);
	}
	

	public int update(PostVo postVo) {
		System.out.println(postVo.toString());
		return courseQnaDao.update(postVo);
	}

	
	
}
