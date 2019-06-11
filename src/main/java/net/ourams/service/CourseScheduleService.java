package net.ourams.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.ourams.dao.CourseScheduleDao;
import net.ourams.dao.UserDao;
import net.ourams.vo.AssignmentVo;
import net.ourams.vo.CourseScheduleVo;
import net.ourams.vo.SubjectVo;
import net.ourams.vo.UserVo;

@Service
public class CourseScheduleService {

		@Autowired
		private UserDao userDao;
		
		@Autowired
		private CourseScheduleDao csDao;
		
		//search particular user
		public List<UserVo> searchUsers(String name){
			List<UserVo> result = new ArrayList<UserVo>();
			List<UserVo> list = userDao.searchUser();
			
			for(UserVo vo : list) {
				String userName = vo.getUserName();
				if(userName.indexOf(name) != -1) {
					result.add(vo);
				}else {
					continue;
				}
			}
			
			for(UserVo vo : result)
				System.out.println(vo.toString());
			
			return result;			
		}
		
		//search all user
		public List<UserVo> searchUserAll() {
			List<UserVo> list = userDao.searchUser();

			return list;
		}
		
		//load all schedule
		public List<CourseScheduleVo> loadSchedule(String coursePath){
			int courseNo = csDao.findCourseNo(coursePath);
			return csDao.loadSchedule(courseNo);
		}
		
		//register new schedule
		public int registerSchedule(CourseScheduleVo vo) {
			
			if(vo.getEventColor().equals("notice")) {
				vo.setEventColor("warning");
			}else if(vo.getEventColor().equals("assign")) {
				vo.setEventColor("pink");
			}else if(vo.getEventColor().equals("course")) {
				vo.setEventColor("dark");
			}else if(vo.getEventColor().equals("team")) {
				vo.setEventColor("purple");
			}else {
				vo.setEventColor("info");
			}
			
			return csDao.registerSchedule(vo);
		}
		
		//find selected schedule
		public Map<String, Object> selectedSchedule(CourseScheduleVo vo) {
			CourseScheduleVo temp = csDao.selectedSchedule(vo);
			AssignmentVo aTemp;
			SubjectVo sTemp;
			
			Map<String, Object> result = new HashMap<String, Object>();
			
			if(temp.getEventColor().equals("warning")) {
				result.put("category", "공지사항");
				csDao.findNotice(temp);
			}else if(temp.getEventColor().equals("pink")) {
				//managing assignment
				String courseName;
				String subjectTitle;
				String chapterContent;
				String teacherName;
				
				result.put("category", "과제");
				aTemp = csDao.findAssignment(temp);
				result.put("title", aTemp.getAssignmentTitle());
				result.put("content", aTemp.getAssignmentContent());
				result.put("startDate", temp.getStartDate());
				result.put("endDate", temp.getEndDate());
				courseName = csDao.findCourseName(aTemp.getCourseNo());
				result.put("courseName", courseName);
				subjectTitle = csDao.findSubjectTitle(aTemp.getSubjectNo());
				result.put("subjectTitle", subjectTitle);
				chapterContent = csDao.findChapterContent(aTemp.getChapterNo());
				result.put("chapterContent", chapterContent);
				teacherName = csDao.findTeacherName(aTemp.getTeacherNo());
				result.put("teacherName", teacherName);
				
				System.out.println(result);
				return result;
			}else if(temp.getEventColor().equals("dark")) {
				String courseName;
				int courseRoomNo;
				String teacherName;
				String coursePath;
			
				result.put("category", "코스 일정");
					
				sTemp = csDao.findCourse(temp);
				System.out.println(sTemp.toString());
				result.put("title", sTemp.getSubjectTitle());
				result.put("content", temp.getScheduleMemo());
				result.put("startDate", temp.getStartDate());
				result.put("endDate", temp.getEndDate());
				courseName = csDao.findCourseName(sTemp.getCourseNo());
				result.put("courseName", courseName);
				courseRoomNo = csDao.findLecRoomNo(sTemp.getCourseNo());
				result.put("roomNo", courseRoomNo);
				teacherName = csDao.findTeacherName(sTemp.getUserNo());
				result.put("teacherName", teacherName);
				coursePath = csDao.findCoursePath(sTemp.getCourseNo());
				result.put("coursePath", coursePath);
				
				System.out.println(result);
				return result;
			}else if(temp.getEventColor().equals("purple")) {
				String userName;
				String courseName;
				
				result.put("category", "팀별 일정");
				result.put("title", temp.getScheduleName());
				result.put("content", temp.getScheduleMemo());
				result.put("startDate", temp.getStartDate());
				result.put("endDate", temp.getEndDate());
				courseName = csDao.findCourseName(temp.getCourseNo());
				result.put("courseName", courseName);
				userName = csDao.findWriter(temp.getUserNo());
				result.put("writer", userName);
			}else {
				String userName;
				String courseName; 
				
				result.put("category", "개인 일정");
				result.put("title", temp.getScheduleName());
				result.put("content", temp.getScheduleMemo());
				result.put("startDate", temp.getStartDate());
				result.put("endDate", temp.getEndDate());
				courseName = csDao.findCourseName(temp.getCourseNo());
				result.put("courseName", courseName);
				userName = csDao.findWriter(temp.getUserNo());
				result.put("writer", userName);
			}
			
			return result;
		}
}
