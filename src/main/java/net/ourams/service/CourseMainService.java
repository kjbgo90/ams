package net.ourams.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.ourams.dao.CourseMainDao;
import net.ourams.dao.UserDao;
import net.ourams.vo.ChapterVo;
import net.ourams.vo.CourseDataroomVo;
import net.ourams.vo.CourseRegistVo;
import net.ourams.vo.CourseVo;
import net.ourams.vo.FeedbackAnswerVo;
import net.ourams.vo.FeedbackQuestionVo;
import net.ourams.vo.SubjectVo;
import net.ourams.vo.UserVo;

@Service
public class CourseMainService {

	@Autowired
	private CourseMainDao courseMDao;
	
	@Autowired
	private UserDao userDao;

	/* @Auth 에서 CoursePath를 체크해주는 서비스 */
	public boolean checkService(String coursePath, int userNo) {

		// 코스 패스에 해당하는 코스의 정보를 가져옴
		CourseVo courseVo = courseMDao.selectCourseVoByCoursePath(coursePath);

		// 코스 패스에 해당하는 코스가 없으면 false 리턴
		if (courseVo == null) {
			return false;
		}

		// 로그인한 유저가 해당 코스의 강사면 true 리턴
		if (userNo == courseVo.getTeacherNo()) {
			return true;
		}

		int courseNo = courseVo.getCourseNo();

		boolean result = courseMDao.selectCourseRegistExist(courseNo, userNo);

		return result;
	}

	/* coursePath 를 가지고 해당 과정의 과목리스트와 마지막 과목의 챕터리스트를 뽑아오는 서비스 */
	public Map<String, Object> getSubjectListAndLastChapterList(String coursePath) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		// 코스패스를 이용해서 해당 코스의 코스 넘버를 가지고옴
		int courseNo = courseMDao.selectCourseVoByCoursePath(coursePath).getCourseNo();
		int LastSubjectNo = 0;
		// 코스넘버를 가지고 해당코스에 등록된 subject 리스트를 가져옴
		List<SubjectVo> subjectList = courseMDao.selectSubjectList(courseNo);
		System.out.println("subject리스트 : " + subjectList.toString());

		// 마지막 코스의 넘버를 가지고 해당 챕터의 리스트를 가져옴
		if(subjectList.size() != 0) {
			LastSubjectNo = subjectList.get(0).getSubjectNo();
		}
		
		System.out.println(LastSubjectNo);
		
		SubjectVo subjectVo = courseMDao.selectSubjectBySubjectNo(LastSubjectNo);
			
		List<ChapterVo> chapterList = courseMDao.selectChapterList(LastSubjectNo);
		System.out.println(chapterList.toString());
	
		map.put("subjectList", subjectList);
		map.put("subjectVo", subjectVo);
		map.put("chapterList", chapterList);
			
		return map;
		
	}

	/* chapterNo를 가지고 해당 chapter를 수정하고 수정된 정보를 보내주는 서비스 */
	@Transactional
	public ChapterVo chapterEdit(int chapterNo, String chapterContent) {
		
		courseMDao.editChapterByChapterNo(chapterNo, chapterContent);
		
		return courseMDao.selectChapterByChapterNo(chapterNo);
	}

	/* subjectVo를 가지고 해당 서브젝트와 스케줄 정보를 수정하고 수정된 정보를 보내주는 서비스 */
	@Transactional
	public SubjectVo subjectEdit(SubjectVo subjectVo) {
		String endDate = subjectVo.getEndDate();
		endDate = endDate + " 18:00:00";
		
		subjectVo.setEndDate(endDate);
		courseMDao.editSubjectBySubjectVo(subjectVo);
		
		return courseMDao.selectSubjectBySubjectNo(subjectVo.getSubjectNo());
	}

	@Transactional
	public void writeSubjectAndSchedule(SubjectVo inputSubjectVo, String coursePath) {
		String endDate = inputSubjectVo.getEndDate();
		endDate = endDate + " 18:00:00";
		System.out.println(endDate);
		inputSubjectVo.setEndDate(endDate);
		
		// 코스패스를 이용해서 해당 코스의 코스 넘버를 가지고옴
		int courseNo = courseMDao.selectCourseVoByCoursePath(coursePath).getCourseNo();
		inputSubjectVo.setCourseNo(courseNo);
		
		courseMDao.insertScheduleBySubjectVo(inputSubjectVo);
		
	}

	public Map<String, Object> getSubjectAndChapterList(int subjectNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		SubjectVo subjectVo = courseMDao.selectSubjectBySubjectNo(subjectNo);
		List<ChapterVo> chapterList = courseMDao.selectChapterList(subjectNo);
		
		map.put("subjectVo", subjectVo);
		map.put("chapterList", chapterList);
		
		return map;
	}

	public int chapterRegist(ChapterVo chapterVo) {
		return courseMDao.insertChapter(chapterVo);
	}

	@Transactional
	public void deleteSubjectAndSchedule(int subjectNo, int scheduleNo) {
		courseMDao.deleteChapterBySubjectNo(subjectNo);
		courseMDao.deleteSubjectBySubjectNo(subjectNo);
		courseMDao.deleteScheduleByScheduleNo(scheduleNo);
	}

	public int deleteChapter(int chapterNo) {
		return courseMDao.deleteChapterByChapterNo(chapterNo);
	}

	public Map<String, Object> getUserListAndChapterList(String coursePath) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		CourseVo courseVo = courseMDao.selectCourseVoByCoursePath(coursePath);
		
		int courseNo = courseVo.getCourseNo();
		int teacherNo = courseVo.getTeacherNo();
		SubjectVo subjectVo = courseMDao.selectNowSubjectVoByCourseNo(courseNo);
		UserVo teacherUserVo = userDao.selecteUser(teacherNo);
		
		if(subjectVo != null) {
			map.put("chapterList", courseMDao.selectChapterList(subjectVo.getSubjectNo()));
		}
		
		map.put("userList", courseMDao.selectUserListByCourseNo(courseNo));
		map.put("teacherUserVo", teacherUserVo);
		map.put("subjectTitle", subjectVo.getSubjectTitle());
		
		return map;
	}

	public boolean seatDecide(String coursePath, int seatNo, UserVo authUser) {

		int courseNo = courseMDao.selectCourseVoByCoursePath(coursePath).getCourseNo();
		int userNo = authUser.getUserNo();
		
		int result = courseMDao.updateCourseRegist(userNo, courseNo, seatNo);
		
		if(result == 1) {
			return true;
		}
		else {
			return false;
		}
	}

	public CourseVo getCourseVo(String coursePath) {
		return courseMDao.selectCourseVoByCoursePath(coursePath);
	}

	public UserVo getUserInfo(int userNo) {
		return courseMDao.selectUserVoByUserNo(userNo);
	}

	public int userEnterRoom(boolean aria, UserVo authUser, String coursePath) {
		int result;
		CourseVo courseVo = courseMDao.selectCourseVoByCoursePath(coursePath);
		
		if(aria == false) {
			result = courseMDao.updateEnterUser(courseVo.getCourseNo(), authUser.getUserNo());
		} else {
			result = courseMDao.updateExitUser(courseVo.getCourseNo(), authUser.getUserNo());
		}
		
		return result;
	}

	@Transactional
	public Map<String, Object> registFbqAndGetFbqVoAndUserInfo(UserVo authUser, int chapterNo, String fbqContent, String coursePath) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		CourseVo courseVo = courseMDao.selectCourseVoByCoursePath(coursePath);
		
		/* 코스레지스트 테이블에서 courseNo와 accessStat = 1(현재 접속중), userType=2(학생)인 사람들의 count를 가져옴 */
		int fbqCount = courseMDao.selectUserCountByCourseNo(courseVo.getCourseNo());
		
		ChapterVo chapterVo = courseMDao.selectChapterByChapterNo(chapterNo);
		
		/* 해당코스 모든 학생 리스트를 불러온다. */
		List<UserVo> userList = courseMDao.selectUserListByCourseNoAndUserType(courseVo.getCourseNo());
		
		
		FeedbackQuestionVo fbqVo = new FeedbackQuestionVo();
		fbqVo.setFbqContent(fbqContent);
		fbqVo.setFbqCount(fbqCount);
		fbqVo.setChapterNo(chapterNo);
		fbqVo.setTeacherNo(authUser.getUserNo());
		fbqVo.setChapterContent(chapterVo.getChapterContent());
		fbqVo.setSubjectTitle(courseMDao.selectSubjectBySubjectNo(chapterVo.getSubjectNo()).getSubjectTitle());
		fbqVo.setCourseNo(courseVo.getCourseNo());
		
		/* feedbackQuestion테이블에 값을 넣어줌 */
		courseMDao.insertFbqByFbqVo(fbqVo);
		
		/* 유저리스트를 가져와서 FeedbackAnswer에 학생들을 넣어준다.(해당코스 모든학생) */
		courseMDao.insertFbaByFbqNo(fbqVo.getFbqNo(), userList);
		
		/* 자리에 없는 학생들을 체크해서 업데이트 해준다. */
		List<UserVo> absenseUserList = courseMDao.selectUserListByCourseNoAndAccessStat0(courseVo.getCourseNo());
		courseMDao.updateFbaAbsenseUsers(fbqVo.getFbqNo(), absenseUserList);
		
		List<FeedbackAnswerVo> fbaList = courseMDao.getFbaListByFbqNo(fbqVo.getFbqNo());
		System.out.println(fbaList.toString());
		System.out.println(fbqVo.toString());
		
		map.put("fbqVo", fbqVo);
		map.put("fbaList", fbaList);
		
		return map;
	}

	public double updateFbaAndFbqPercent(FeedbackAnswerVo fbaVo) {
		courseMDao.updateFbaAndFbqByFbaVo(fbaVo);
		
		return courseMDao.selectFbqPercentByFbqNo(fbaVo.getFbqNo());
	}

	public List<CourseVo> getCourseList(int userNo) {
		return courseMDao.selectCourseListByUserNo(userNo);
	}

	public List<CourseVo> getCourseList(int userNo, int userType) {
		return courseMDao.selectCourseListByUserNoAndUserType(userNo, userType);
	}

	@Transactional
	public int insertCourseByCourseVoAndRegistCourseAndInsertDataRoom(CourseVo createCourseVo,
			List<Integer> userNoList) {
		int resultCourse = courseMDao.insertCourseByCourseVo(createCourseVo);
		
		if(resultCourse == 1) {
			int courseNo = createCourseVo.getCourseNo();
			CourseRegistVo crVo = new CourseRegistVo();
			crVo.setCourseNo(courseNo);
			crVo.setSeatNo(0);
			
			int resultCR = 0;
			
			//학생을 넣어줌
			for(int i = 0; i < userNoList.size(); i++) {
				crVo.setUserNo(userNoList.get(i));
				resultCR += courseMDao.insertCourseregistByCourseRegistVo(crVo);
			}
			
			//강사를 넣어줌
			if(resultCR == userNoList.size()) {
				crVo.setSeatNo(99);
				crVo.setUserNo(createCourseVo.getTeacherNo());
				courseMDao.insertCourseregistByCourseRegistVo(crVo);
			}
			
			CourseDataroomVo drVo = new CourseDataroomVo();
			drVo.setCourseNo(courseNo);
			drVo.setDataRoomName("root");
			drVo.setpRoomNo(0);
			courseMDao.insertDataroomByDataroomVo(drVo);
		}
		
		return resultCourse;
	}

	public List<UserVo> getAllStudentList() {
		return courseMDao.selectAllStudentList();
	}

	public List<UserVo> getAllTeacherList() {
		return courseMDao.selectAllTeacherList();
	}

	

}
