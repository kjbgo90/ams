package net.ourams.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.ourams.dao.CourseAssignmentDao;
import net.ourams.dao.CourseMainDao;
import net.ourams.dao.CourseStatisticDao;
import net.ourams.vo.AssignmentVo;
import net.ourams.vo.CourseVo;
import net.ourams.vo.FeedbackQuestionVo;
import net.ourams.vo.StatisticVo;
import net.ourams.vo.SubjectVo;
import net.ourams.vo.SubmitVo;
import net.ourams.vo.UserVo;

@Service
public class CourseStatisticService {

	@Autowired
	private CourseStatisticDao statisticDao;

	@Autowired
	private CourseMainDao mainDao;

	@Autowired
	private CourseAssignmentDao assignmentDao;

	public Map<String, Object> getUserList(String coursePath) {
		Map<String, Object> map = new HashMap<String, Object>();

		CourseVo courseVo = mainDao.selectCourseVoByCoursePath(coursePath);
		List<UserVo> userList = statisticDao.selectUserListByCourseNo(courseVo.getCourseNo());

		map.put("courseVo", courseVo);
		map.put("userList", userList);

		return map;
	}

	public Map<String, Object> getMain(int courseNo) {
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

		double maxAverage = asList.get(0).getAverage();
		double minAverage = asList.get(0).getAverage();
		for (StatisticVo asVo : asList) {
			maxAverage = Math.max(maxAverage, asVo.getAverage());
			minAverage = Math.min(minAverage, asVo.getAverage());
		}
		
		AssignmentVo lastAssignment = assignmentList.get(assignmentList.size()-1);
		StatisticVo statisticVo = statisticDao.selectSubmitCountByAssignmentNo(lastAssignment.getAssignmentNo());
		System.out.println(statisticVo.toString());
		double submitPercent = statisticVo.getSubmitCount() / (double)studentCount * 100;
		double unsubmitPercent = 100 - submitPercent;
		
		/* ############################################################################# */
		
		List<FeedbackQuestionVo> feedbackQuestionList = statisticDao.selectFeedbackQuestionList(courseNo);
		List<StatisticVo> feedbackList = new ArrayList<StatisticVo>();
		int totalYes = 0;
		int totalNo = 0;
		int totalNonResponse = 0;
		for(FeedbackQuestionVo fbqVo : feedbackQuestionList) {
			StatisticVo fbaVo = statisticDao.selectFeedbackAnswer(fbqVo.getFbqNo());
			System.out.println(fbaVo.toString());
			double yesPercent = Math.round(fbaVo.getYesCount() / (double)studentCount * 100);
			double noPercent = Math.round(fbaVo.getNoCount() / (double)studentCount * 100);
			double nonResponsePercent = 100 - yesPercent - noPercent;
			
			totalYes += fbaVo.getYesCount();
			totalNo += fbaVo.getNoCount();
			totalNonResponse += studentCount - fbaVo.getYesCount() - fbaVo.getNoCount();
			
			fbaVo.setYesPercent(yesPercent);
			fbaVo.setNoPercent(noPercent);
			fbaVo.setNonResponsePercent(nonResponsePercent);
			
			feedbackList.add(fbaVo);
		}
		
		int totalFeedback = totalYes + totalNo + totalNonResponse;
		double totalYesPercent = Math.round(totalYes / (double)totalFeedback * 100);
		double totalNoPercent = Math.round(totalNo / (double)totalFeedback * 100);
		double totalNonResponsePercent = 100 - totalYesPercent - totalNoPercent;
		
		/* ############################################################################# */
		
		List<SubjectVo> subjectList = statisticDao.selectSubjectList(courseNo);
		List<StatisticVo> qnaTempList = new ArrayList<StatisticVo>();
		int[] qnaCount = new int[subjectList.size()];
		int i = 0;
		int qnaTotal = 0;
		for(SubjectVo subjectVo : subjectList) {
			StatisticVo qnaVo = statisticDao.selectQnA(subjectVo.getSubjectNo());
			qnaCount[i] = qnaVo.getQnaCount();
			qnaTotal += qnaVo.getQnaCount();
			qnaTempList.add(qnaVo);
			i++;
		}
		
		for(int j=0; j<qnaCount.length; j++) {
			for(int k=j+1; k<qnaCount.length; k++) {
				if(qnaCount[j] < qnaCount[k]) {
					int temp = qnaCount[j];
					qnaCount[j] = qnaCount[k];
					qnaCount[k] = temp;
				}
			}
		}
		
		System.out.println(qnaCount[0]);
		System.out.println(qnaCount[1]);
		System.out.println(qnaCount[2]);
		List<StatisticVo> qnaList = new ArrayList<StatisticVo>();
		for(int a=0; a<3; a++) {
			for(StatisticVo qnaVo : qnaTempList) {
				if(qnaVo.getQnaCount() == qnaCount[a] && qnaVo.getQnaCount() != 0) {
					qnaVo.setQnaPercent(Math.round(qnaVo.getQnaCount()/(double)qnaTotal*100));
					qnaList.add(a, qnaVo);
					break;
				}
			}
		}
		System.out.println(qnaList);
		
		map.put("asList", asList);
		map.put("maxAverage", maxAverage);
		map.put("minAverage", minAverage);
		map.put("totalAverage", totalAverage);
		map.put("lastAssignmentTitle", lastAssignment.getAssignmentTitle());
		map.put("submitPercent", submitPercent);
		map.put("unsubmitPercent", unsubmitPercent);
		map.put("feedbackList", feedbackList);
		map.put("totalYesPercent", totalYesPercent);
		map.put("totalNoPercent", totalNoPercent);
		map.put("totalNonResponsePercent", totalNonResponsePercent);
		map.put("qnaList", qnaList);
		
		System.out.println(map.toString());
		
		return map;
	}

	public Map<String, Object> getStudentStatistic(String coursePath, int userNo) {
		Map<String, Object> map = new HashMap<String, Object>();

		CourseVo courseVo = mainDao.selectCourseVoByCoursePath(coursePath);
		List<AssignmentVo> assignmentList = statisticDao.selectAssignmentListByCourseNo(courseVo.getCourseNo());
		for (AssignmentVo assignmentVo : assignmentList) {
			SubmitVo submitVo = statisticDao.selectSubmitByUserNo(assignmentVo.getAssignmentNo(), userNo);
			
		}
		
		return map;
	}
}
