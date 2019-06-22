package net.ourams.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.ourams.dao.CourseAssignmentDao;
import net.ourams.dao.CourseMainDao;
import net.ourams.vo.AssignmentVo;
import net.ourams.vo.ChapterVo;
import net.ourams.vo.CourseVo;
import net.ourams.vo.SubjectVo;
import net.ourams.vo.SubmitVo;
import net.ourams.vo.fileUpLoadVo;

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
		List<fileUpLoadVo> fileList = assignmentDao.selectAssignmentFileList();
		
		for(AssignmentVo assignmentVo : assignmentList) {
			List<fileUpLoadVo> assignmentFileList = new ArrayList<fileUpLoadVo>();
			for (fileUpLoadVo fileVo : fileList) {
				if (assignmentVo.getAssignmentNo() == fileVo.getAssignmentNo()) {
					assignmentFileList.add(fileVo);
				}
			}
			assignmentVo.setFileList(assignmentFileList);
			System.out.println(assignmentVo.getAssignmentTitle() + " 파일 리스트: " + assignmentVo.getFileList());
		}

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
		List<fileUpLoadVo> submitFileList = assignmentDao.selectSubmitFileList();
		
		for(SubmitVo submitVo : submitList) {
			List<fileUpLoadVo> submitFileList2 = new ArrayList<fileUpLoadVo>();
			for (fileUpLoadVo fileVo : submitFileList) {
				if (submitVo.getSubmitNo() == fileVo.getSubmitNo()) {
					submitFileList2.add(fileVo);
				}
			}
			submitVo.setFileList(submitFileList2);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("assignmentList", assignmentList);
		map.put("subjectList", subjectList);
		map.put("lastAssignment", lastAssignment);
		map.put("submitList", submitList);
		map.put("submitListCount", submitList.size());

		return map;
	}

	public SubmitVo submit(SubmitVo submitVo) {
		int count = assignmentDao.countSubmittedAssign(submitVo);
		if(count == 0) {
			assignmentDao.insertSubmit(submitVo);
			
			
			if (submitVo.getFileList() != null) {
				for (fileUpLoadVo fileVo : submitVo.getFileList()) {
					assignmentDao.insertFile(fileVo);
					assignmentDao.insertSubmitFile(submitVo.getSubmitNo(), fileVo.getFileNo());
				}
			}
			SubmitVo submitVo2 = assignmentDao.selectSubmitBySubmitNo(submitVo.getSubmitNo());
			submitVo2.setFileList(submitVo.getFileList());
			return submitVo2;
		} else {
			return null;
		}
	}

	public SubmitVo getSubmit(int submitNo) {
		SubmitVo submitVo = assignmentDao.selectSubmitBySubmitNo(submitNo);
		List<fileUpLoadVo> fileList = assignmentDao.selectSubmitFileList();
		List<fileUpLoadVo> submitFileList = new ArrayList<fileUpLoadVo>();
		
		for(fileUpLoadVo fileVo : fileList) {
			if(fileVo.getSubmitNo() == submitVo.getSubmitNo()) {
				submitFileList.add(fileVo);
			}
		}
		submitVo.setFileList(submitFileList);
		
		System.out.println(submitVo);
		return submitVo;
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
		List<fileUpLoadVo> fileList = assignmentDao.selectSubmitFileList();
		
		for(SubmitVo submitVo : submitList) {
			List<fileUpLoadVo> submitFileList = new ArrayList<fileUpLoadVo>();
			for (fileUpLoadVo fileVo : fileList) {
				if (submitVo.getSubmitNo() == fileVo.getSubmitNo()) {
					submitFileList.add(fileVo);
				}
			}
			submitVo.setFileList(submitFileList);
		}
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
		map.put("courseVo", courseVo);

		return map;
	}

	public List<ChapterVo> getChapterList(int subjectNo) {
		return assignmentDao.selectChapterListBySubjectNo(subjectNo);
	}

	@Transactional
	public int enrollAssignment(AssignmentVo assignmentVo) {
		assignmentDao.insertAssignmentSchedule(assignmentVo);
		int count = assignmentDao.insertAssignment(assignmentVo);

		if (assignmentVo.getFileList() != null) {
			for (fileUpLoadVo fileVo : assignmentVo.getFileList()) {
				assignmentDao.insertFile(fileVo);
				assignmentDao.insertAssignmentFile(assignmentVo.getAssignmentNo(), fileVo.getFileNo());
			}
		}

		return count;
	}

	public int fileUploadInDB(fileUpLoadVo fileVo) {
		return assignmentDao.insertFile(fileVo);
	}

	public Map<String, Object> getModifyPage(String coursePath, int assignmentNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		CourseVo courseVo = mainDao.selectCourseVoByCoursePath(coursePath);
		AssignmentVo assignmentVo = assignmentDao.selectAssignmentByAssignmentNo(assignmentNo);
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

		map.put("assignmentVo", assignmentVo);
		map.put("subjectList", subjectList);
		map.put("courseVo", courseVo);
		return map;
	}

	@Transactional
	public int modifyAssignment(AssignmentVo assignmentVo) {
		assignmentDao.updateAssignmentSchedule(assignmentVo);
		int count = assignmentDao.updateAssignment(assignmentVo);
		assignmentDao.deleteAssignmentFile(assignmentVo);
		
		if (assignmentVo.getFileList() != null) {
			for (fileUpLoadVo fileVo : assignmentVo.getFileList()) {
				assignmentDao.insertFile(fileVo);
				assignmentDao.insertAssignmentFile(assignmentVo.getAssignmentNo(), fileVo.getFileNo());
			}
		}

		return count;
	}

	public int saveScore(SubmitVo submitVo) {
		return assignmentDao.updateSubmitScore(submitVo);
	}

	public List<fileUpLoadVo> getFileList(AssignmentVo assignmentVo) {
		return assignmentDao.selectFileListByAssignmentNo(assignmentVo);
	}

}
