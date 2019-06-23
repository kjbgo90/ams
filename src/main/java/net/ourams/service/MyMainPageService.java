package net.ourams.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.ourams.dao.CourseAssignmentDao;
import net.ourams.dao.MyMainPageDao;
import net.ourams.vo.AssignmentVo;
import net.ourams.vo.CourseVo;
import net.ourams.vo.MyPageVo;
import net.ourams.vo.PostVo;
import net.ourams.vo.SubmitVo;
import net.ourams.vo.TimelineVo;
import net.ourams.vo.fileUpLoadVo;

@Service
public class MyMainPageService {

	@Autowired
	private MyMainPageDao myMainPageDao;

	@Autowired
	private CourseAssignmentDao assignmentDao;

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

	public List<TimelineVo> selectTimelineList(TimelineVo vo) {
		vo.setRnum(4);
		List<TimelineVo> list = myMainPageDao.selectTimelineList(vo);
		return list;
	}

	public List<TimelineVo> selectTimelineAllList(TimelineVo vo) {
		List<TimelineVo> list = myMainPageDao.selectTimelineAllList(vo);
		return list;
	}

	// 컨트롤러에서 assignmentvo 안에 courseNo랑 userNo 넣어서 보내기
	public List<SubmitVo> selectAssignmentList(int userNo) {
		List<SubmitVo> list = new ArrayList<SubmitVo>();
		List<CourseVo> courseList = assignmentDao.selectCourseListByUserNo(userNo);
		for (CourseVo courseVo : courseList) {
			List<AssignmentVo> assignmentList = assignmentDao.selectList(courseVo.getCourseNo());
			System.out.println(assignmentList.toString());
			for (AssignmentVo vo : assignmentList) {
				System.out.println(vo.toString());
				SubmitVo submitVo = new SubmitVo();
				SubmitVo submitVo2 = assignmentDao.selectSubmitByUserNo(vo.getAssignmentNo(), userNo);
				
				if (submitVo2 != null) {
					
					submitVo2.setCourseNo(vo.getCourseNo());
					List<fileUpLoadVo> fileList = assignmentDao.selectSubmitFileList();
					List<fileUpLoadVo> submitFileList = new ArrayList<fileUpLoadVo>();

					for (fileUpLoadVo fileVo : fileList) {
						if (fileVo.getSubmitNo() == submitVo2.getSubmitNo()) {
							submitFileList.add(fileVo);
						}
					}

					submitVo2.setFileList(submitFileList);
					list.add(submitVo2);
					
				} else {
					
					System.out.println("null brfore" + vo.toString());
					System.out.println(vo.getAssignmentTitle());
					submitVo.setAssignmentTitle(vo.getAssignmentTitle());
					System.out.println("null after" + vo.toString());
					submitVo.setCourseNo(vo.getCourseNo());
					list.add(submitVo);
					
				}
			}
		}
		System.out.println(list.toString());

		return list;
	}

}
