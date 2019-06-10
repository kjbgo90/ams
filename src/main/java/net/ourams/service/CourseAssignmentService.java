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
import net.ourams.vo.ChapterVo;
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

		for (SubjectVo subjectVo : subjectList) {
			List<AssignmentVo> assignListBySubject = new ArrayList<AssignmentVo>();
			for (AssignmentVo assignmentVo : assignmentList) {
				if (subjectVo.getSubjectNo() == assignmentVo.getSubjectNo()) {
					assignListBySubject.add(assignmentVo);
				}
			}
			subjectVo.setAssignmentListBySub(assignListBySubject);
			System.out.println(subjectVo.getSubjectTitle() + " 과제 리스트: " + subjectVo.getAssignmentListBySub());
		}

		AssignmentVo lastAssignment = assignmentList.get(0);

		List<SubmitVo> submitList = assignmentDao.selectSubmitList(lastAssignment.getAssignmentNo());

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("assignmentList", assignmentList);
		map.put("subjectList", subjectList);
		map.put("lastAssignment", lastAssignment);
		map.put("submitList", submitList);
		map.put("submitListCount", submitList.size());

		return map;
	}

	public SubmitVo submit(SubmitVo submitVo) {
		assignmentDao.insertSubmit(submitVo);
		return assignmentDao.selectSubmitBySubmitNo(submitVo.getSubmitNo());
	}

	public SubmitVo getSubmit(int submitNo) {
		return assignmentDao.selectSubmitBySubmitNo(submitNo);
	}

	public int deleteSubmit(int submitNo, int userNo) {
		int count = 0;
		SubmitVo submitVo = assignmentDao.selectSubmitBySubmitNo(submitNo);
		if (submitVo.getUserNo() == userNo) {
			count = assignmentDao.deleteSubmit(submitNo);
		}
		return count;
	}

	public Map<String, Object> getAssignment(int assignmentNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		AssignmentVo assignmentVo = assignmentDao.selectAssignmentByAssignmentNo(assignmentNo);
		List<SubmitVo> submitList = assignmentDao.selectSubmitList(assignmentNo);

		map.put("assignmentVo", assignmentVo);
		map.put("submitList", submitList);

		return map;
	}

	public Map<String, Object> getEnrollPage(String coursePath) {
		Map<String, Object> map = new HashMap<String, Object>();

		CourseVo courseVo = mainDao.selectCourseVoByCoursePath(coursePath);
		List<SubjectVo> subjectList = assignmentDao.selectSubList(courseVo.getCourseNo());
		List<ChapterVo> chapterList = assignmentDao.selectChapterList();

		for (SubjectVo subjectVo : subjectList) {
			List<ChapterVo> chapterListBySubject = new ArrayList<ChapterVo>();
			for (ChapterVo chapterVo : chapterList) {
				if (subjectVo.getSubjectNo() == chapterVo.getSubjectNo()) {
					chapterListBySubject.add(chapterVo);
				}
			}
			subjectVo.setChapterList(chapterListBySubject);
			System.out.println(subjectVo.getSubjectTitle() + " 챕터 리스트: " + subjectVo.getChapterList());
		}

		map.put("subjectList", subjectList);

		return map;
	}

	public List<ChapterVo> getChapterList(int subjectNo) {
		return assignmentDao.selectChapterListBySubjectNo(subjectNo);
	}

}
