package net.ourams.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.ourams.dao.PostDao;
import net.ourams.vo.CourseVo;
import net.ourams.vo.PostVo;
import net.ourams.vo.TimelineVo;
import net.ourams.vo.UserVo;
import net.ourams.vo.fileUpLoadVo;

@Service
public class PostService {
	
	@Autowired
	private PostDao postDao;
	
	public Map<String, Object> selectPostPaging(int courseNo, int pageNo){
		int listSize = 10 ;
		int pageNo1 = 1+listSize*(pageNo-1);
		int pageNo2 = listSize*pageNo;
		int countPage = postDao.countPost();
		System.out.println("countPage"+countPage);
		int maxPage = (int)Math.ceil((double)countPage/listSize);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("courseNo", courseNo);
		map.put("pageNo1", pageNo1);
		map.put("pageNo2", pageNo2);
		List<PostVo> list = postDao.selectPaging(map);
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("list", list);
		map2.put("maxPage", maxPage);
		return map2;
	}
	

	public  Map<String, Object> searchList(String postTitle,int courseNo, int pageNo){
		int listSize = 10 ;
		int pageNo1 = 1+listSize*(pageNo-1);
		int pageNo2 = listSize*pageNo;
		int countPage = postDao.countPost();
		System.out.println("countPage"+countPage);
		int maxPage = (int)Math.ceil((double)countPage/listSize);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("courseNo", courseNo);
		map.put("pageNo1", pageNo1);
		map.put("pageNo2", pageNo2);
		map.put("postTitle", postTitle);
		List<PostVo> list = postDao.searchList(map);
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("list", list);
		map2.put("maxPage", maxPage);
		
		return map2;
	}
	
	
	public PostVo read(int postNo) {
		postDao.updateHit(postNo);
		PostVo PostVo = postDao.selectNotice(postNo);
		return PostVo;
	}

	public int write(PostVo postVo) {
		System.out.println(postVo.toString());
		int count = postDao.insert(postVo);
		
	
		TimelineVo vo = new TimelineVo();
		vo.setUserNo(postVo.getUserNo());
		System.out.println(postVo.getUserNo());
		CourseVo coursevo = new CourseVo();
		coursevo.setCoursePath(postVo.getCoursePath());
		CourseVo coursevo2 = postDao.selectCoursePath(coursevo);
		String coursePath = postVo.getCoursePath();
		System.out.println("coursePath is" + coursePath);
		String courseName = coursevo2.getCourseName();
		System.out.println("courseName is " + courseName);
		
		
		String timeLineContent = "["+courseName+"]"+postVo.getUserName()+"님의 공지사항이 올라왔습니다!</p>";
		
		// timeline 테이블에 저장  
		vo.setTimeLineContent(timeLineContent);
		
		
		postDao.insertTimeline(vo);
		
		
		System.out.println("timeline no is "+vo.getTimeLineNo());
		
		
		int timeLineNo = vo.getTimeLineNo();
		// 코스 안에 있는 모든 유저들을 등록하자 ! 
		List<UserVo> list = postDao.selectListbyCoursePath(coursevo);
		System.out.println(list.toString());
		for(int i = 0; i < list.size() ; i ++) {
			int userNo = list.get(i).getUserNo();
			System.out.println(userNo);
			System.out.println("user No is "+userNo);
			TimelineVo vo2 = new TimelineVo();
			vo2.setUserNo(userNo);
			vo2.setTimeLineNo(timeLineNo);
			
			//timelineuser 테이블에 저장 
			postDao.insertTimelineUser(vo2);
			
		}
		System.out.println(vo);
		
		
		
		
		
		

		if (postVo.getFileList() != null) {
			for (fileUpLoadVo fileVo : postVo.getFileList()) {
				postDao.insertFile(fileVo);
				postDao.insertPostFile(postVo.getPostNo(), fileVo.getFileNo());
			}
		}
		return  count;
		
		
		
	}
	
	public int update(PostVo postVo) {
		System.out.println(postVo.toString());
		return postDao.update(postVo);
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

	
	@Transactional
	public int writePostSchedule(PostVo postVo) {
		postDao.insertSchedule(postVo);
		int count = postDao.insertSchedulePost(postVo);
		if (postVo.getFileList() != null) {
			for (fileUpLoadVo fileVo : postVo.getFileList()) {
				postDao.insertFile(fileVo);
				postDao.insertPostFile(postVo.getPostNo(), fileVo.getFileNo());
			}
		}
		return count;
	}
	public List<fileUpLoadVo> getFileList(PostVo postVo) {
		// TODO Auto-generated method stub
		return postDao.selectFileListByPostNo(postVo);
	}
	

}
