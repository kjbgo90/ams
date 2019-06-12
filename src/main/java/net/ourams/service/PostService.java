package net.ourams.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.ourams.dao.PostDao;
import net.ourams.vo.PostVo;

@Service
public class PostService {
	
	@Autowired
	private PostDao postDao;
	
	public List<PostVo> getList(int courseNo){
		List<PostVo> noticeList = postDao.selectAll(courseNo); 
		System.out.println(noticeList.toString());
		return noticeList;
	}

	public PostVo read(int postNo) {
		postDao.updateHit(postNo);
		PostVo PostVo = postDao.selectNotice(postNo);
		return PostVo;
	}

	public int write(PostVo postVo) {
		System.out.println(postVo.toString());
		return postDao.insert(postVo);
	}

	public int delete(PostVo postVo) {
		System.out.println(postVo.toString());
		return postDao.delete(postVo);
	}

	public PostVo modifyform(int postNo) {
		PostVo postVo = postDao.selectNotice(postNo);
		return postVo;
	}

	public int modify(PostVo postVo) {
		return postDao.update(postVo); 
	}

	

}
