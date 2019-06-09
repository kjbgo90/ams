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
import net.ourams.vo.UserVo;

@Service
public class CourseScheduleService {

		@Autowired
		private UserDao userDao;
		
		@Autowired
		private CourseScheduleDao csDao;
		
		//search user
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
		
		//load all schedule
		public List<CourseScheduleVo> loadSchedule(){
			return csDao.loadSchedule();
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
				result.put("category", "코스 일정");
				csDao.findCourse(temp);
			}else if(temp.getEventColor().equals("purple")) {
				result.put("category", "팀별 일정");
			}else {
				result.put("category", "개인 일정");
			}
			
			return result;
		}
}
