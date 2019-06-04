package net.ourams.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.ourams.dao.CourseAssignmentDao;
import net.ourams.dao.CourseMainDao;
import net.ourams.vo.AssignmentVo;
import net.ourams.vo.CourseVo;
import net.ourams.vo.SubjectVo;

@Service
public class CourseAssignmentService {

	@Autowired
	private CourseAssignmentDao assignmentDao;
	
	@Autowired
	private CourseMainDao mainDao;
	
	/* 전체 과제 selectList */
	public Map<String, Object> getList(String coursePath) {
		CourseVo courseVo = mainDao.selectCourseVoByCoursePath(coursePath);
		List<AssignmentVo> assignmentList = assignmentDao.selectList(courseVo.getCourseNo());
		List<SubjectVo> subjectList = assignmentDao.selectSubList(courseVo.getCourseNo());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("assignmentList", assignmentList);
		map.put("subjectList", subjectList);
		
		return map;
	}

}
