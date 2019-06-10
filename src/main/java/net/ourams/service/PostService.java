package net.ourams.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.ourams.dao.PostDao;
import net.ourams.vo.PostVo;

@Service
public class PostService {
	
	@Autowired
	private PostDao PostDao;
	
	public List<PostVo> getList(int courseNo){
		List<PostVo> noticeList = PostDao.selectAll(courseNo); 
		System.out.println(noticeList.toString());
		return noticeList;
	}

	public PostVo read(int postNo) {
		//PostDao.updateHit(postNo);
		PostVo PostVo = PostDao.selectNotice(postNo);
		return PostVo;
	}

	public int write(PostVo postVo) {
		System.out.println("#########################");
		System.out.println(postVo.toString());
		return PostDao.insert(postVo);
	}
}
