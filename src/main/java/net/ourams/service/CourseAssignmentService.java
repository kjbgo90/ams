package net.ourams.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.ourams.dao.CourseAssignmentDao;
import net.ourams.vo.AssignmentVo;

@Service
public class CourseAssignmentService {

	@Autowired
	private CourseAssignmentDao assignmentDao;
	
	public List<AssignmentVo> getList(int courseNo) {
		return assignmentDao.selectList(courseNo);
	}

}
