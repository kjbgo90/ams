package net.ourams.vo;

public class StatisticVo {

	private String assignmentTitle;
	private double average;
	private int submitCount;
	private int score;
	private String scoreCheck;
	private int fbqNo;
	private String fbqContent;
	private int fbqCount;
	private String subjectTitle;
	private String chapterContent;
	private int yesCount;
	private int noCount;
	private int nonResponseCount;
	private double yesPercent;
	private double noPercent;
	private double nonResponsePercent;
	private int qnaCount;
	private double qnaPercent;
	private int subjectNo;
	private int maxScore;
	private int minScore;
	private int fbaType;

	public StatisticVo() {
	}

	public StatisticVo(String assignmentTitle, double average, int submitCount, int score, String scoreCheck, int fbqNo,
			String fbqContent, int fbqCount, String subjectTitle, String chapterContent, int yesCount, int noCount,
			int nonResponseCount, double yesPercent, double noPercent, double nonResponsePercent, int qnaCount,
			double qnaPercent, int subjectNo, int maxScore, int minScore, int fbaType) {
		this.assignmentTitle = assignmentTitle;
		this.average = average;
		this.submitCount = submitCount;
		this.score = score;
		this.scoreCheck = scoreCheck;
		this.fbqNo = fbqNo;
		this.fbqContent = fbqContent;
		this.fbqCount = fbqCount;
		this.subjectTitle = subjectTitle;
		this.chapterContent = chapterContent;
		this.yesCount = yesCount;
		this.noCount = noCount;
		this.nonResponseCount = nonResponseCount;
		this.yesPercent = yesPercent;
		this.noPercent = noPercent;
		this.nonResponsePercent = nonResponsePercent;
		this.qnaCount = qnaCount;
		this.qnaPercent = qnaPercent;
		this.subjectNo = subjectNo;
		this.maxScore = maxScore;
		this.minScore = minScore;
		this.fbaType = fbaType;
	}

	public String getAssignmentTitle() {
		return assignmentTitle;
	}

	public void setAssignmentTitle(String assignmentTitle) {
		this.assignmentTitle = assignmentTitle;
	}

	public double getAverage() {
		return average;
	}

	public void setAverage(double average) {
		this.average = average;
	}

	public int getSubmitCount() {
		return submitCount;
	}

	public void setSubmitCount(int submitCount) {
		this.submitCount = submitCount;
	}

	public String getScoreCheck() {
		return scoreCheck;
	}

	public void setScoreCheck(String scoreCheck) {
		this.scoreCheck = scoreCheck;
	}

	public int getFbqNo() {
		return fbqNo;
	}

	public void setFbqNo(int fbqNo) {
		this.fbqNo = fbqNo;
	}

	public String getFbqContent() {
		return fbqContent;
	}

	public void setFbqContent(String fbqContent) {
		this.fbqContent = fbqContent;
	}

	public int getFbqCount() {
		return fbqCount;
	}

	public void setFbqCount(int fbqCount) {
		this.fbqCount = fbqCount;
	}

	public String getSubjectTitle() {
		return subjectTitle;
	}

	public void setSubjectTitle(String subjectTitle) {
		this.subjectTitle = subjectTitle;
	}

	public String getChapterContent() {
		return chapterContent;
	}

	public void setChapterContent(String chapterContent) {
		this.chapterContent = chapterContent;
	}

	public int getYesCount() {
		return yesCount;
	}

	public void setYesCount(int yesCount) {
		this.yesCount = yesCount;
	}

	public int getNoCount() {
		return noCount;
	}

	public void setNoCount(int noCount) {
		this.noCount = noCount;
	}

	public int getNonResponseCount() {
		return nonResponseCount;
	}

	public void setNonResponseCount(int nonResponseCount) {
		this.nonResponseCount = nonResponseCount;
	}

	public double getYesPercent() {
		return yesPercent;
	}

	public void setYesPercent(double yesPercent) {
		this.yesPercent = yesPercent;
	}

	public double getNoPercent() {
		return noPercent;
	}

	public void setNoPercent(double noPercent) {
		this.noPercent = noPercent;
	}

	public double getNonResponsePercent() {
		return nonResponsePercent;
	}

	public void setNonResponsePercent(double nonResponsePercent) {
		this.nonResponsePercent = nonResponsePercent;
	}

	public int getQnaCount() {
		return qnaCount;
	}

	public void setQnaCount(int qnaCount) {
		this.qnaCount = qnaCount;
	}

	public double getQnaPercent() {
		return qnaPercent;
	}

	public void setQnaPercent(double qnaPercent) {
		this.qnaPercent = qnaPercent;
	}

	public int getSubjectNo() {
		return subjectNo;
	}

	public void setSubjectNo(int subjectNo) {
		this.subjectNo = subjectNo;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getMaxScore() {
		return maxScore;
	}

	public void setMaxScore(int maxScore) {
		this.maxScore = maxScore;
	}

	public int getMinScore() {
		return minScore;
	}

	public void setMinScore(int minScore) {
		this.minScore = minScore;
	}

	public int getFbaType() {
		return fbaType;
	}

	public void setFbaType(int fbaType) {
		this.fbaType = fbaType;
	}

	@Override
	public String toString() {
		return "StatisticVo [assignmentTitle=" + assignmentTitle + ", average=" + average + ", submitCount="
				+ submitCount + ", score=" + score + ", scoreCheck=" + scoreCheck + ", fbqNo=" + fbqNo + ", fbqContent="
				+ fbqContent + ", fbqCount=" + fbqCount + ", subjectTitle=" + subjectTitle + ", chapterContent="
				+ chapterContent + ", yesCount=" + yesCount + ", noCount=" + noCount + ", nonResponseCount="
				+ nonResponseCount + ", yesPercent=" + yesPercent + ", noPercent=" + noPercent + ", nonResponsePercent="
				+ nonResponsePercent + ", qnaCount=" + qnaCount + ", qnaPercent=" + qnaPercent + ", subjectNo="
				+ subjectNo + ", maxScore=" + maxScore + ", minScore=" + minScore + ", fbaType=" + fbaType + "]";
	}

}
