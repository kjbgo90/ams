package net.ourams.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import net.ourams.dao.UserDao;
import net.ourams.vo.UserVo;

@Service
public class CourseScheduleService {

		@Autowired
		private UserDao dao;
		public List<UserVo> searchUsers(String name){
			List<UserVo> result = new ArrayList<UserVo>();
			List<UserVo> list = dao.searchUser();
			
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
}
