package net.ourams.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.ourams.dao.MyMainPageDao;
import net.ourams.vo.MyPageVo;

@Service
public class MyMainPageService {

	@Autowired
	private MyMainPageDao myMainPageDao;
	
	public List<MyPageVo> courseList(MyPageVo vo){
		List<MyPageVo> list = myMainPageDao.courseList(vo);
		return list;
	}
	
}
