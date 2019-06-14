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
import net.ourams.vo.PostVo;
import net.ourams.vo.ScheduleTagVo;
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
		public List<CourseScheduleVo> loadSchedule(String coursePath, UserVo authUser){
			int courseNo = csDao.findCourseNo(coursePath);
			List<CourseScheduleVo> list = new ArrayList();
			CourseScheduleVo vo = new CourseScheduleVo();
			
			vo.setCourseNo(courseNo);
			vo.setUserNo(authUser.getUserNo());
			
			//add notice schedule
			vo.setEventColor("warning");
			List<CourseScheduleVo> temp = csDao.loadCourseSchedule(vo);
			list.addAll(temp);
			
			//add assign schedule
			vo.setEventColor("pink");
			temp = csDao.loadCourseSchedule(vo);
			list.addAll(temp);
			
			//add course schedule
			vo.setEventColor("dark");
			temp = csDao.loadCourseSchedule(vo);
			list.addAll(temp);
			
			//add Team&personal schedule
			temp = csDao.loadPersonalSchedule(vo);
			list.addAll(temp);
			
			return list;
		}
		
		public List<String> loadTag(int courseNo){
			List<Integer> userNoList = csDao.loadTag(courseNo);
			List<String> userNameList = new ArrayList();
			
			for(int i=0; i<userNoList.size(); i++) {
				userNameList.add(csDao.findTeacherName(userNoList.get(i)));
			}
			
			return userNameList;
		}
		
		//register new schedule
		public int registerSchedule(List<Object> multiParam, UserVo authUser, String coursePath) {
			System.out.println(multiParam.toString());
			// insert into CourseScehduleVo
			HashMap<String, Object> map = (HashMap<String, Object>) multiParam.get(1);
			CourseScheduleVo csVo = new CourseScheduleVo((String)map.get("scheduleName"), (String)map.get("scheduleMemo"), (String)map.get("startDate"),
									(String)map.get("endDate"), (String)map.get("eventColor"), csDao.findCourseNo(coursePath), authUser.getUserNo());
			
			System.out.println(csVo);
			
			if(csVo.getEventColor().equals("notice")) {
				csVo.setEventColor("warning");
			}else if(csVo.getEventColor().equals("assign")) {
				csVo.setEventColor("pink");
			}else if(csVo.getEventColor().equals("course")) {
				csVo.setEventColor("dark");
			}else if(csVo.getEventColor().equals("team")) {
				csVo.setEventColor("purple");
			}else {
				csVo.setEventColor("info");
			}
			
			int scheduleFlag = csDao.registerSchedule(csVo);
			
			// insert into ScheduleTagVo
			
			List<Integer> tagList = (List<Integer>)(multiParam.get(0));
			
			int tagFlag = 0;
			int scheduleNo = csVo.getScheduleNo();
			
			for(int i=0; i<tagList.size(); i++) {
				
				ScheduleTagVo stVo = new ScheduleTagVo();
				stVo.setScheduleNo(scheduleNo);
				
				stVo.setUserNo(Integer.parseInt(""+tagList.get(i)));
				tagFlag = csDao.registerScheduleTag(stVo);
				if(tagFlag == 0) {
					System.out.println("error");
					break;
				}
			}
			
			if(tagFlag == 1 && scheduleFlag == 1)
				return 1;
			else 
				return 0;
						
		}
		
		//find selected schedule
		public Map<String, Object> selectedSchedule(CourseScheduleVo vo) {
			CourseScheduleVo temp = csDao.selectedSchedule(vo);
			PostVo pTemp;
			AssignmentVo aTemp;
			SubjectVo sTemp;
			
			Map<String, Object> result = new HashMap<String, Object>();
			
			if(temp.getEventColor().equals("warning")) {
				String writer;
				String courseName;
				
				pTemp = csDao.findNotice(temp);
				result.put("category", "공지사항");
				result.put("title", pTemp.getPostTitle());
				result.put("content", pTemp.getPostContent());
				result.put("regDate", pTemp.getRegDate());
				result.put("typeCategory", pTemp.getCategory());
				courseName = csDao.findCourseName(pTemp.getCourseNo());
				result.put("courseName", courseName);
				result.put("hit", pTemp.getHit());
				writer = csDao.findTeacherName(pTemp.getUserNo());
				result.put("writer", writer);
				
				System.out.println(result);
				return result;
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
				result.put("scheduleNo", temp.getScheduleNo());
				result.put("writerNo", temp.getUserNo());
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
				result.put("scheduleNo", temp.getScheduleNo());
				result.put("writerNo", temp.getUserNo());
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
		
		public List<CourseScheduleVo> searchSchedule(CourseScheduleVo vo){
			return csDao.searchSchedule(vo);
		}
		
		public int deleteSchedule(CourseScheduleVo vo) {
			int flag = csDao.deleteTag(vo);
			
			if(flag == 1) 
				return csDao.deleteSchedule(vo);
			else 
				return 0;
		}
}

		