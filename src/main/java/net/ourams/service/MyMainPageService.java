package net.ourams.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.ourams.dao.MyMainPageDao;
import net.ourams.vo.CourseVo;
import net.ourams.vo.MyPageVo;
import net.ourams.vo.PostVo;
import net.ourams.vo.TimelineVo;

@Service
public class MyMainPageService {

	@Autowired
	private MyMainPageDao myMainPageDao;

	public List<MyPageVo> courseList(MyPageVo vo) {
		List<MyPageVo> list = myMainPageDao.courseList(vo);
		return list;
	}

	// post type = 2
	public List<PostVo> selectQna(PostVo vo) {
		
		vo.setRnum(4);
		List<PostVo> list = myMainPageDao.selectQna(vo);
		return list;
	}
	

	
	// post type = 1
	public List<PostVo> selectNotice(PostVo vo) {
			vo.setRnum(4);
			List<PostVo> list = myMainPageDao.selectNotice(vo);
			return list;
	}
		
	public PostVo selectCoursePath(PostVo vo1) {
		PostVo vo = myMainPageDao.selectCoursePath(vo1);
		return vo;
	}
	
	public List<TimelineVo> selectTimelineList(TimelineVo vo){
		vo.setRnum(4);
		List<TimelineVo> list = myMainPageDao.selectTimelineList(vo);
		return list;
	}
	
	
	public List<TimelineVo> selectTimelineAllList(TimelineVo vo){
		List<TimelineVo> list = myMainPageDao.selectTimelineAllList(vo);
		return list;
	}

}
