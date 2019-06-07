package net.ourams.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.ourams.dao.CourseScheduleDao;
import net.ourams.dao.UserDao;
import net.ourams.vo.CourseScheduleVo;
import net.ourams.vo.UserVo;

@Service
public class CourseScheduleService {

		@Autowired
		private UserDao userDao;
		
		@Autowired
		private CourseScheduleDao csDao;
		
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
		
		public List<CourseScheduleVo> loadSchedule(){
			return csDao.loadSchedule();
		}
		
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
}
