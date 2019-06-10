package net.ourams.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.ourams.dao.CourseMainDao;
import net.ourams.vo.ChapterVo;
import net.ourams.vo.CourseVo;
import net.ourams.vo.SubjectVo;

@Service
public class CourseMainService {

	@Autowired
	private CourseMainDao courseMDao;

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

		// 코스넘버를 가지고 해당코스에 등록된 subject 리스트를 가져옴
		List<SubjectVo> subjectList = courseMDao.selectSubjectList(courseNo);
		System.out.println(subjectList.toString());

		// 마지막 코스의 넘버를 가지고 해당 챕터의 리스트를 가져옴
		int LastSubjectNo = subjectList.get(0).getSubjectNo();
		SubjectVo subjectVo = courseMDao.selectSubjectBySubjectNo(LastSubjectNo);
		
		System.out.println(LastSubjectNo);
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
		
		courseMDao.editSubjectBySubjectVo(subjectVo);
		
		
		return courseMDao.selectSubjectBySubjectNo(subjectVo.getSubjectNo());
	}

	@Transactional
	public void writeSubjectAndSchedule(SubjectVo inputSubjectVo, String coursePath) {
		
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

	

}
