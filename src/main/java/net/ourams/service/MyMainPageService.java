package net.ourams.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.ourams.dao.MyMainPageDao;
import net.ourams.vo.MyPageVo;
import net.ourams.vo.PostVo;

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
		vo.setPostType(2);
		vo.setRnum(3);
		List<PostVo> list = myMainPageDao.selectPost(vo);
		return list;
	}
	
	// post type = 1
		public List<PostVo> selectNotice(PostVo vo) {
			vo.setPostType(1);
			vo.setRnum(3);
			List<PostVo> list = myMainPageDao.selectPost(vo);
			return list;
		}

}
