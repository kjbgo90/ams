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
import net.ourams.vo.TimelineVo;
import net.ourams.vo.UserVo;
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

		for (AssignmentVo assignmentVo : assignmentList) {
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

		for (SubmitVo submitVo : submitList) {
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

	public SubmitVo submit(SubmitVo submitVo, String coursePath) {
		int count = assignmentDao.countSubmittedAssign(submitVo);
		if (count == 0) {
			assignmentDao.insertSubmit(submitVo);

			if (submitVo.getFileList() != null) {
				for (fileUpLoadVo fileVo : submitVo.getFileList()) {
					assignmentDao.insertFile(fileVo);
					assignmentDao.insertSubmitFile(submitVo.getSubmitNo(), fileVo.getFileNo());
				}
			}
			SubmitVo submitVo2 = assignmentDao.selectSubmitBySubmitNo(submitVo.getSubmitNo());
			submitVo2.setFileList(submitVo.getFileList());

			AssignmentVo assignmentVo = assignmentDao.selectAssignmentByAssignmentNo(submitVo2.getAssignmentNo());
			CourseVo courseVo = mainDao.selectCourseVoByCoursePath(coursePath);
			String timeLineContent = "[" + courseVo.getCourseName() + "]" + submitVo2.getUserName() + "님이 "
					+ assignmentVo.getAssignmentTitle() + " 과제를 제출했습니다!</p>";

			TimelineVo timelineVo = new TimelineVo();

			// timeline 테이블에 저장
			timelineVo.setTimeLineContent(timeLineContent);

			assignmentDao.insertTimeline(timelineVo);

			System.out.println("timeline no is " + timelineVo.getTimeLineNo());

			int timeLineNo = timelineVo.getTimeLineNo();

			TimelineVo vo2 = new TimelineVo();
			vo2.setUserNo(assignmentVo.getTeacherNo());
			vo2.setTimeLineNo(timeLineNo);

			// timelineuser 테이블에 저장
			assignmentDao.insertTimelineUser(vo2);

			return submitVo2;
		} else {
			return null;
		}
	}

	public SubmitVo getSubmit(int submitNo) {
		SubmitVo submitVo = assignmentDao.selectSubmitBySubmitNo(submitNo);
		List<fileUpLoadVo> fileList = assignmentDao.selectSubmitFileList();
		List<fileUpLoadVo> submitFileList = new ArrayList<fileUpLoadVo>();

		for (fileUpLoadVo fileVo : fileList) {
			if (fileVo.getSubmitNo() == submitVo.getSubmitNo()) {
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

		for (SubmitVo submitVo : submitList) {
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
	public int enrollAssignment(AssignmentVo assignmentVo, String coursePath) {
		assignmentDao.insertAssignmentSchedule(assignmentVo);
		int count = assignmentDao.insertAssignment(assignmentVo);

		if (assignmentVo.getFileList() != null) {
			for (fileUpLoadVo fileVo : assignmentVo.getFileList()) {
				assignmentDao.insertFile(fileVo);
				assignmentDao.insertAssignmentFile(assignmentVo.getAssignmentNo(), fileVo.getFileNo());
			}
		}

		assignmentVo = assignmentDao.selectAssignmentByAssignmentNo(assignmentVo.getAssignmentNo());
		CourseVo courseVo = mainDao.selectCourseVoByCoursePath(coursePath);
		String timeLineContent = "[" + courseVo.getCourseName() + "]" + assignmentVo.getAssignmentTitle()
				+ " 과제가 올라왔습니다!(제출기한: " + assignmentVo.getEndDate() + "까지)</p>";

		TimelineVo timelineVo = new TimelineVo();

		// timeline 테이블에 저장
		timelineVo.setTimeLineContent(timeLineContent);

		assignmentDao.insertTimeline(timelineVo);

		System.out.println("timeline no is " + timelineVo.getTimeLineNo());

		int timeLineNo = timelineVo.getTimeLineNo();
		// 코스 안에 있는 모든 유저들을 등록하자 !
		List<UserVo> list = assignmentDao.selectListbyCoursePath(courseVo);
		System.out.println(list.toString());
		for (int i = 0; i < list.size(); i++) {
			int userNo = list.get(i).getUserNo();
			System.out.println(userNo);
			System.out.println("user No is " + userNo);
			TimelineVo vo2 = new TimelineVo();
			vo2.setUserNo(userNo);
			vo2.setTimeLineNo(timeLineNo);

			// timelineuser 테이블에 저장
			assignmentDao.insertTimelineUser(vo2);

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
	public int modifyAssignment(AssignmentVo assignmentVo, String coursePath) {
		assignmentDao.updateAssignmentSchedule(assignmentVo);
		int count = assignmentDao.updateAssignment(assignmentVo);
		assignmentDao.deleteAssignmentFile(assignmentVo);

		if (assignmentVo.getFileList() != null) {
			for (fileUpLoadVo fileVo : assignmentVo.getFileList()) {
				assignmentDao.insertFile(fileVo);
				assignmentDao.insertAssignmentFile(assignmentVo.getAssignmentNo(), fileVo.getFileNo());
			}
		}

		assignmentVo = assignmentDao.selectAssignmentByAssignmentNo(assignmentVo.getAssignmentNo());
		CourseVo courseVo = mainDao.selectCourseVoByCoursePath(coursePath);
		String timeLineContent = "[" + courseVo.getCourseName() + "]" + assignmentVo.getAssignmentTitle()
				+ " 과제가 수정되었습니다!</p>";

		TimelineVo timelineVo = new TimelineVo();

		// timeline 테이블에 저장
		timelineVo.setTimeLineContent(timeLineContent);

		assignmentDao.insertTimeline(timelineVo);

		System.out.println("timeline no is " + timelineVo.getTimeLineNo());

		int timeLineNo = timelineVo.getTimeLineNo();
		// 코스 안에 있는 모든 유저들을 등록하자 !
		List<UserVo> list = assignmentDao.selectListbyCoursePath(courseVo);
		System.out.println(list.toString());
		for (int i = 0; i < list.size(); i++) {
			int userNo1 = list.get(i).getUserNo();
			System.out.println(userNo1);
			System.out.println("user No is " + userNo1);
			TimelineVo vo2 = new TimelineVo();
			vo2.setUserNo(userNo1);
			vo2.setTimeLineNo(timeLineNo);

			// timelineuser 테이블에 저장
			assignmentDao.insertTimelineUser(vo2);

		}
		return count;
	}

	@Transactional
	public int saveScore(SubmitVo submitVo, String coursePath) {
		int count = assignmentDao.updateSubmitScore(submitVo);
		SubmitVo submitVo2 = assignmentDao.selectSubmitBySubmitNo(submitVo.getSubmitNo());
		AssignmentVo assignmentVo = assignmentDao.selectAssignmentByAssignmentNo(submitVo2.getAssignmentNo());
		CourseVo courseVo = mainDao.selectCourseVoByCoursePath(coursePath);
		String timeLineContent = "[" + courseVo.getCourseName() + "]" + assignmentVo.getAssignmentTitle()
				+ " 과제 성적이 입력되었습니다!</p>";

		TimelineVo timelineVo = new TimelineVo();

		// timeline 테이블에 저장
		timelineVo.setTimeLineContent(timeLineContent);

		assignmentDao.insertTimeline(timelineVo);

		System.out.println("timeline no is " + timelineVo.getTimeLineNo());

		int timeLineNo = timelineVo.getTimeLineNo();
		
		TimelineVo vo2 = new TimelineVo();
		vo2.setUserNo(submitVo2.getUserNo());
		vo2.setTimeLineNo(timeLineNo);

		// timelineuser 테이블에 저장
		assignmentDao.insertTimelineUser(vo2);

		return count;
	}

	public List<fileUpLoadVo> getFileList(AssignmentVo assignmentVo) {
		return assignmentDao.selectFileListByAssignmentNo(assignmentVo);
	}

	@Transactional
	public int deleteAssignment(int assignmentNo, int userNo, String coursePath) {
		AssignmentVo assignmentVo = assignmentDao.selectAssignmentByAssignmentNo(assignmentNo);

		CourseVo courseVo = mainDao.selectCourseVoByCoursePath(coursePath);
		String timeLineContent = "[" + courseVo.getCourseName() + "]" + assignmentVo.getAssignmentTitle()
				+ " 과제가 삭제되었습니다!</p>";

		TimelineVo timelineVo = new TimelineVo();

		// timeline 테이블에 저장
		timelineVo.setTimeLineContent(timeLineContent);

		assignmentDao.insertTimeline(timelineVo);

		System.out.println("timeline no is " + timelineVo.getTimeLineNo());

		int timeLineNo = timelineVo.getTimeLineNo();
		// 코스 안에 있는 모든 유저들을 등록하자 !
		List<UserVo> list = assignmentDao.selectListbyCoursePath(courseVo);
		System.out.println(list.toString());
		for (int i = 0; i < list.size(); i++) {
			int userNo1 = list.get(i).getUserNo();
			System.out.println(userNo1);
			System.out.println("user No is " + userNo1);
			TimelineVo vo2 = new TimelineVo();
			vo2.setUserNo(userNo1);
			vo2.setTimeLineNo(timeLineNo);

			// timelineuser 테이블에 저장
			assignmentDao.insertTimelineUser(vo2);

		}

		List<SubmitVo> submitList = assignmentDao.selectSubmitList(assignmentNo);
		for (SubmitVo submitVo : submitList) {
			assignmentDao.deleteSubmitFile(submitVo.getSubmitNo());
			assignmentDao.deleteSubmit(submitVo.getSubmitNo());
		}
		assignmentDao.deleteAssignmentFile(assignmentVo);
		assignmentDao.deleteAssignment(assignmentNo, userNo);
		return assignmentDao.deleteAssignmentSchedule(assignmentVo.getScheduleNo());
	}

}
