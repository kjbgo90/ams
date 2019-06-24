package net.ourams.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.ourams.dao.CourseAssignmentDao;
import net.ourams.dao.CourseStatisticDao;
import net.ourams.dao.MyMainPageDao;
import net.ourams.vo.AssignmentVo;
import net.ourams.vo.CourseVo;
import net.ourams.vo.MyPageVo;
import net.ourams.vo.PostVo;
import net.ourams.vo.StatisticVo;
import net.ourams.vo.SubmitVo;
import net.ourams.vo.TimelineVo;
import net.ourams.vo.UserVo;
import net.ourams.vo.fileUpLoadVo;

@Service
public class MyMainPageService {

	@Autowired
	private MyMainPageDao myMainPageDao;
	
	@Autowired 
	private CourseStatisticDao statisticDao;

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
	
	public List<SubmitVo> selectAssignmentAllList(SubmitVo vo){
		List<SubmitVo> list = myMainPageDao.selectAssignmentAllList(vo);
		
		
		
		return list;
	}

	public List<Integer> courseNoList(int userNo){
		List<Integer> list = myMainPageDao.courseNoList(userNo);
		return list;
	}
	
	
	public List<AssignmentVo> getAssignmentByTeacherNo(int userNo){
	      List<AssignmentVo> assignmentList = assignmentDao.selectAssignmentListByTeacherNo(userNo);
	      List<fileUpLoadVo> fileList = assignmentDao.selectAssignmentFileList();
	      System.out.println(fileList);
	      for(AssignmentVo assignmentVo : assignmentList) {
	         //과제 출제 할 때 넣어놓은 파일들 가져오는 부분
	         List<fileUpLoadVo> assignmentFileList = new ArrayList<fileUpLoadVo>();
	         	System.out.println("afileList "+assignmentFileList.toString());
	         for (fileUpLoadVo fileVo : fileList) {
	        	 System.out.println("fileVo "+fileVo.toString());
	            if (assignmentVo.getAssignmentNo() == fileVo.getAssignmentNo()) {
	            	System.out.println("equal vo ");
	               assignmentFileList.add(fileVo);
	            }
	         }
	         assignmentVo.setFileList(assignmentFileList);
	         
	         //학생들이 제출한 과제 리스트 가져오는 부분
	         List<SubmitVo> submitList = assignmentDao.selectSubmitList(assignmentVo.getAssignmentNo());
	         System.out.println("submitToString "+submitList.toString());
	         List<fileUpLoadVo> submitFileList = assignmentDao.selectSubmitFileList();
	         System.out.println("submitFileList "+submitFileList.toString());
	         //제출한 과제 안에 파일들 가져오는 부분
	         for(SubmitVo submitVo : submitList) {
	        	 System.out.println("submitVo "+submitVo.toString());
	            List<fileUpLoadVo> submitFileList2 = new ArrayList<fileUpLoadVo>();
	            for (fileUpLoadVo fileVo : submitFileList) {
	            	System.out.println("secont vo "+fileVo.toString());
	               if (submitVo.getSubmitNo() == fileVo.getSubmitNo()) {
	            	   System.out.println("second hi ");
	                  submitFileList2.add(fileVo);
	               }
	            }
	            submitVo.setFileList(submitFileList2);
	         }
	         assignmentVo.setSubmitList(submitList);
	      }
	      
	      //assignmentList 강사가 출제한 과제 리스트
	      //   -> assignmentVo.fileList 강사가 출제할 때 넣은 파일리스트 List<fileUpLoadVo>
	      //   -> assignmentVo.submitList 한 과제에 대해 학생들이 제출한 submit리스트 List<Submit>
	      //      -> assignmentVo.submitList[i].fileList 학생이 제출한 submit안에 들어있는 파일 리스트 List<fileUpLoadVo>
	      
	      return assignmentList;
	   }
	
	public List<SubmitVo> getSubmitListByUserNo(int userNo){
	      //로그인한 user가 제출한 과제 리스트 가져오는 부분
	      List<SubmitVo> submitList = assignmentDao.selectSubmitListByUserNo(userNo);
	      List<fileUpLoadVo> submitFileList = assignmentDao.selectSubmitFileList();
	      //제출한 과제 안에 파일들 가져오는 부분
	      for(SubmitVo submitVo : submitList) {
	         List<fileUpLoadVo> submitFileList2 = new ArrayList<fileUpLoadVo>();
	         for (fileUpLoadVo fileVo : submitFileList) {
	            if (submitVo.getSubmitNo() == fileVo.getSubmitNo()) {
	               submitFileList2.add(fileVo);
	            }
	         }
	         submitVo.setFileList(submitFileList2);
	      }
	      
	      return submitList;
	   }
	
	public Map<String, Object> assignmentAverageList(int courseNo) {
	      Map<String, Object> map = new HashMap<String, Object>();

	      List<UserVo> userList = statisticDao.selectUserListByCourseNo(courseNo);
	      int studentCount = userList.size();

	      List<AssignmentVo> assignmentList = statisticDao.selectAssignmentListByCourseNo(courseNo);
	      List<StatisticVo> asList = new ArrayList<StatisticVo>();
	      double totalAverage = 0;
	      int totalSum = 0;
	      int totalScoreCount = 0;
	      for (AssignmentVo assignmentVo : assignmentList) {
	         int sum = 0;
	         int scoreCount = 0;
	         int submitCount = 0;
	         int unsubmitCount = 0;
	         double avg = 0;
	         
	         List<SubmitVo> submitList = assignmentDao.selectSubmitList(assignmentVo.getAssignmentNo());
	         for (SubmitVo submitVo : submitList) {
	            if (submitVo.getScoreCheck().equals("true")) {
	               scoreCount++;
	               sum += submitVo.getScore();
	            }
	         }
	         totalSum += sum;
	         totalScoreCount += scoreCount;
	         submitCount = submitList.size();
	         unsubmitCount = studentCount - submitCount;
	         if (scoreCount != 0) {
	            avg = sum / (double) scoreCount;
	            avg = Math.round(avg * 100) / 100.0;
	         }
	         System.out.println(assignmentVo.getAssignmentTitle() + " : 평균 " + avg + "점 / 점수입력완료 " + scoreCount
	               + " / 제출 " + submitCount + "명 / 미제출 " + unsubmitCount + "명");
	         StatisticVo asVo = new StatisticVo();
	         asVo.setAssignmentTitle(assignmentVo.getAssignmentTitle());
	         asVo.setAverage(avg);
	         asList.add(asVo);
	      }
	      
	      totalAverage = Math.round(totalSum / totalScoreCount * 100) / 100;
	      
	      AssignmentVo lastAssignment = assignmentList.get(assignmentList.size()-1);
	      StatisticVo statisticVo = statisticDao.selectSubmitCountByAssignmentNo(lastAssignment.getAssignmentNo());
	      System.out.println(statisticVo.toString());
	      double submitPercent = statisticVo.getSubmitCount() / (double)studentCount * 100;
	      double unsubmitPercent = 100 - submitPercent;      
	      
	      map.put("asList", asList); // assignmentStatistic List(StatisticVo)
	      map.put("totalAverage", totalAverage);
	      map.put("lastAssignmentTitle", lastAssignment.getAssignmentTitle());
	      map.put("submitPercent", submitPercent);
	      map.put("unsubmitPercent", unsubmitPercent);
	      
	      System.out.println(map.toString());
	      
	      return map;
	   }
	
	
	
}
