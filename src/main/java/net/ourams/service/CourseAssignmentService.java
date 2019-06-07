package net.ourams.service;

import java.util.ArrayList;
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
import net.ourams.vo.SubmitVo;

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
		
		for( SubjectVo subjectVo : subjectList) {
			List<AssignmentVo> assignListBySubject = new ArrayList<AssignmentVo>();
			for( AssignmentVo assignmentVo : assignmentList) {
				if(subjectVo.getSubjectNo() == assignmentVo.getSubjectNo()) {
					assignListBySubject.add(assignmentVo);
				}
			}
			subjectVo.setAssignmentListBySub(assignListBySubject);
			System.out.println(subjectVo.getSubjectTitle() + " 과제 리스트: " + subjectVo.getAssignmentListBySub());
		}
		
		AssignmentVo lastAssignment = assignmentList.get(0);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("assignmentList", assignmentList);
		map.put("subjectList", subjectList);
		map.put("lastAssignment", lastAssignment);
		
		return map;
	}

	public int submit(SubmitVo submitVo) {
		return assignmentDao.insertSubmit(submitVo);
	}

}
