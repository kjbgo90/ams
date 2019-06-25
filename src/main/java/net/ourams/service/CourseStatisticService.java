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
		if (asList.size() > 0) {
			double totalAverage = 0;
			int totalSum = 0;
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
					} else {
						sum += 0;
					}
				}
				totalSum += sum;
				submitCount = submitList.size();
				unsubmitCount = studentCount - submitCount;
				if (scoreCount != 0) {
					avg = sum / (double) studentCount;
					avg = Math.round(avg * 100) / 100.0;
				}
				System.out.println(assignmentVo.getAssignmentTitle() + " : 평균 " + avg + "점 / 점수입력완료 " + scoreCount
						+ " / 제출 " + submitCount + "명 / 미제출 " + unsubmitCount + "명");
				StatisticVo asVo = new StatisticVo();
				asVo.setAssignmentTitle(assignmentVo.getAssignmentTitle());
				asVo.setAverage(avg);
				asList.add(asVo);
			}

			if (assignmentList.size() != 0) {
				totalAverage = Math.round(totalSum / (studentCount * assignmentList.size()) * 100) / 100;
			}

			double maxAverage = asList.get(0).getAverage();
			double minAverage = asList.get(0).getAverage();
			for (StatisticVo asVo : asList) {
				maxAverage = Math.max(maxAverage, asVo.getAverage());
				minAverage = Math.min(minAverage, asVo.getAverage());
			}

			AssignmentVo lastAssignment = assignmentList.get(assignmentList.size() - 1);
			StatisticVo statisticVo = statisticDao.selectSubmitCountByAssignmentNo(lastAssignment.getAssignmentNo());
			System.out.println(statisticVo.toString());
			double submitPercent = statisticVo.getSubmitCount() / (double) studentCount * 100;
			double unsubmitPercent = 100 - submitPercent;

			map.put("asList", asList);
			map.put("maxAverage", maxAverage);
			map.put("minAverage", minAverage);
			map.put("totalAverage", totalAverage);
			map.put("lastAssignmentTitle", lastAssignment.getAssignmentTitle());
			map.put("submitPercent", submitPercent);
			map.put("unsubmitPercent", unsubmitPercent);

		} else {
			double maxAverage = 0;
			double minAverage = 0;
			double totalAverage = 0;
			AssignmentVo lastAssignment = new AssignmentVo();
			lastAssignment.setAssignmentTitle("없음");
			double submitPercent = 0;
			double unsubmitPercent = 0;
			List<StatisticVo> asList1 = new ArrayList<StatisticVo>();

			map.put("asList", asList1);
			map.put("maxAverage", maxAverage);
			map.put("minAverage", minAverage);
			map.put("totalAverage", totalAverage);
			map.put("lastAssignmentTitle", lastAssignment.getAssignmentTitle());
			map.put("submitPercent", submitPercent);
			map.put("unsubmitPercent", unsubmitPercent);
		}
		/*
		 * #############################################################################
		 */

		List<FeedbackQuestionVo> feedbackQuestionList = statisticDao.selectFeedbackQuestionList(courseNo);
		List<StatisticVo> feedbackList = new ArrayList<StatisticVo>();
		if (feedbackList.size() > 0) {
			int totalYes = 0;
			int totalNo = 0;
			int totalNonResponse = 0;
			for (FeedbackQuestionVo fbqVo : feedbackQuestionList) {
				StatisticVo fbaVo = statisticDao.selectFeedbackAnswer(fbqVo.getFbqNo());
				System.out.println(fbaVo.toString());
				double yesPercent = Math.round(fbaVo.getYesCount() / (double) studentCount * 100);
				double noPercent = Math.round(fbaVo.getNoCount() / (double) studentCount * 100);
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
			double totalYesPercent = Math.round(totalYes / (double) totalFeedback * 100);
			double totalNoPercent = Math.round(totalNo / (double) totalFeedback * 100);
			double totalNonResponsePercent = 100 - totalYesPercent - totalNoPercent;

			map.put("feedbackList", feedbackList);
			map.put("totalYesPercent", totalYesPercent);
			map.put("totalNoPercent", totalNoPercent);
			map.put("totalNonResponsePercent", totalNonResponsePercent);
		} else {
			double totalYesPercent = 0;
			double totalNoPercent = 0;
			double totalNonResponsePercent = 100 - totalYesPercent - totalNoPercent;
			
			map.put("feedbackList", feedbackList);
			map.put("totalYesPercent", totalYesPercent);
			map.put("totalNoPercent", totalNoPercent);
			map.put("totalNonResponsePercent", totalNonResponsePercent);
		}
		/*
		 * #############################################################################
		 */

		List<SubjectVo> subjectList = statisticDao.selectSubjectList(courseNo);
		List<StatisticVo> qnaTempList = new ArrayList<StatisticVo>();
		int[] qnaCount = new int[subjectList.size()];
		int i = 0;
		int qnaTotal = 0;
		for (SubjectVo subjectVo : subjectList) {
			StatisticVo qnaVo = statisticDao.selectQnA(subjectVo.getSubjectNo());
			qnaCount[i] = qnaVo.getQnaCount();
			qnaTotal += qnaVo.getQnaCount();
			qnaTempList.add(qnaVo);
			i++;
		}

		for (int j = 0; j < qnaCount.length; j++) {
			for (int k = j + 1; k < qnaCount.length; k++) {
				if (qnaCount[j] < qnaCount[k]) {
					int temp = qnaCount[j];
					qnaCount[j] = qnaCount[k];
					qnaCount[k] = temp;
				}
			}
		}

		List<StatisticVo> qnaList = new ArrayList<StatisticVo>();
		if (qnaCount.length > 3) {
			for (int a = 0; a < 3; a++) {
				int index = 0;
				for (StatisticVo qnaVo : qnaTempList) {
					if (qnaVo.getQnaCount() == qnaCount[a] && qnaVo.getQnaCount() != 0) {
						qnaVo.setQnaPercent(Math.round(qnaVo.getQnaCount() / (double) qnaTotal * 100));
						qnaList.add(a, qnaVo);
						qnaTempList.remove(index);
						break;
					}
					index++;
				}
			}
		} else {
			for (int a = 0; a < qnaCount.length; a++) {
				int index = 0;
				for (StatisticVo qnaVo : qnaTempList) {
					if (qnaVo.getQnaCount() == qnaCount[a] && qnaVo.getQnaCount() != 0) {
						qnaVo.setQnaPercent(Math.round(qnaVo.getQnaCount() / (double) qnaTotal * 100));
						qnaList.add(a, qnaVo);
						qnaTempList.remove(index);
						break;
					}
					index++;
				}
			}
		}
		System.out.println(qnaList);


		map.put("qnaList", qnaList);

		System.out.println(map.toString());

		return map;
	}

	public Map<String, Object> getStudentStatistic(String coursePath, int userNo) {
		Map<String, Object> map = new HashMap<String, Object>();

		CourseVo courseVo = mainDao.selectCourseVoByCoursePath(coursePath);
		List<AssignmentVo> assignmentList = new ArrayList<AssignmentVo>();
		assignmentList = statisticDao.selectAssignmentListByCourseNo(courseVo.getCourseNo());
		List<StatisticVo> asList = new ArrayList<StatisticVo>();

		double totalAverage = 0;
		int totalSum = 0;
		for (AssignmentVo assignmentVo : assignmentList) {
			StatisticVo submitVo = new StatisticVo();
			StatisticVo submitVo2 = statisticDao.selectSubmitByUserNo(assignmentVo.getAssignmentNo(), userNo);

			submitVo.setAssignmentTitle(assignmentVo.getAssignmentTitle());
			if (submitVo2 == null) {
				submitVo.setScore(0);
			} else {
				submitVo.setScore(submitVo2.getScore());
			}

			totalSum += submitVo.getScore();

			asList.add(submitVo);
		}

		StatisticVo max = new StatisticVo();
		max = statisticDao.selectMaxScore(courseVo.getCourseNo(), userNo);
		StatisticVo min = new StatisticVo();
		min = statisticDao.selectMinScore(courseVo.getCourseNo(), userNo);

		StatisticVo submitCountVo = statisticDao.selectSubmitCountByUserNo(courseVo.getCourseNo(), userNo);
		if (submitCountVo.getSubmitCount() < assignmentList.size() || submitCountVo.getNoCount() > 0) {
			min.setMinScore(0);
		}

		totalAverage = Math.round(totalSum / (double) assignmentList.size() * 100) / 100;

		AssignmentVo lastAssignment = assignmentList.get(assignmentList.size() - 1);
		StatisticVo statisticVo = new StatisticVo();
		statisticVo = statisticDao.selectSubmitByUserNo(lastAssignment.getAssignmentNo(), userNo);
		double submitPercent = 0;
		double unsubmitPercent = 0;
		if (statisticVo != null) {
			submitPercent = 100;
			unsubmitPercent = 100 - submitPercent;
		} else {
			submitPercent = 0;
			unsubmitPercent = 100 - submitPercent;
		}

		/*
		 * #############################################################################
		 */

		List<FeedbackQuestionVo> feedbackQuestionList = statisticDao.selectFeedbackQuestionList(courseVo.getCourseNo());
		List<StatisticVo> feedbackList = new ArrayList<StatisticVo>();
		int totalYes = 0;
		int totalNo = 0;
		int totalNonResponse = 0;
		for (FeedbackQuestionVo fbqVo : feedbackQuestionList) {
			StatisticVo fbaVo = statisticDao.selectFeedbackAnswerByUserNo(fbqVo.getFbqNo(), userNo);
			System.out.println(fbaVo.toString());

			if (fbaVo.getFbaType() == 1) {
				totalYes++;
				fbaVo.setYesPercent(100);
			} else if (fbaVo.getFbaType() == 2) {
				totalNo++;
				fbaVo.setNoPercent(100);
			} else {
				totalNonResponse++;
				fbaVo.setNonResponsePercent(100);
			}
			System.out.println(fbaVo);
			feedbackList.add(fbaVo);
		}

		int totalFeedback = totalYes + totalNo + totalNonResponse;
		double totalYesPercent = Math.round(totalYes / (double) totalFeedback * 100);
		double totalNoPercent = Math.round(totalNo / (double) totalFeedback * 100);
		double totalNonResponsePercent = 100 - totalYesPercent - totalNoPercent;

		/*
		 * #############################################################################
		 */

		List<SubjectVo> subjectList = statisticDao.selectSubjectList(courseVo.getCourseNo());
		List<StatisticVo> qnaTempList = new ArrayList<StatisticVo>();
		int[] qnaCount = new int[subjectList.size()];
		int i = 0;
		int qnaTotal = 0;
		for (SubjectVo subjectVo : subjectList) {
			StatisticVo qnaVo = new StatisticVo();
			qnaVo = statisticDao.selectQnAByUserNo(subjectVo.getSubjectNo(), userNo);
			if (qnaVo == null)
				continue;
			qnaCount[i] = qnaVo.getQnaCount();
			qnaTotal += qnaVo.getQnaCount();
			qnaTempList.add(qnaVo);
			i++;
		}

		for (int j = 0; j < qnaCount.length; j++) {
			for (int k = j + 1; k < qnaCount.length; k++) {
				if (qnaCount[j] < qnaCount[k]) {
					int temp = qnaCount[j];
					qnaCount[j] = qnaCount[k];
					qnaCount[k] = temp;
				}
			}
		}

		List<StatisticVo> qnaList = new ArrayList<StatisticVo>();
		for (int a = 0; a < 3; a++) {
			for (StatisticVo qnaVo : qnaTempList) {
				if (qnaVo.getQnaCount() == qnaCount[a] && qnaVo.getQnaCount() != 0) {
					qnaVo.setQnaPercent(Math.round(qnaVo.getQnaCount() / (double) qnaTotal * 100));
					qnaList.add(a, qnaVo);
					break;
				}
			}
		}
		System.out.println(qnaList);

		map.put("asList", asList);
		map.put("totalAverage", totalAverage);
		map.put("maxScore", max.getMaxScore());
		map.put("minScore", min.getMinScore());
		map.put("totalAverage", totalAverage);
		map.put("lastAssignmentTitle", lastAssignment.getAssignmentTitle());
		map.put("submitPercent", submitPercent);
		map.put("unsubmitPercent", unsubmitPercent);
		map.put("feedbackList", feedbackList);
		map.put("totalYesPercent", totalYesPercent);
		map.put("totalNoPercent", totalNoPercent);
		map.put("totalNonResponsePercent", totalNonResponsePercent);
		map.put("qnaList", qnaList);

		return map;
	}
}
