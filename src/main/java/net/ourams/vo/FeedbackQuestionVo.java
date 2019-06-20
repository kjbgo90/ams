package net.ourams.vo;

public class FeedbackQuestionVo {

	private int fbqNo;
	private String fbqContent;
	private int fbqCount;
	private int chapterNo;
	private int teacherNo;
	private double percent;
	private int courseNo;
	private String subjectTitle;
	private String chapterContent;

	public FeedbackQuestionVo() {
	}

	public FeedbackQuestionVo(int fbqNo, String fbqContent, int fbqCount, int chapterNo, int teacherNo, double percent,
			int courseNo, String subjectTitle, String chapterContent) {
		this.fbqNo = fbqNo;
		this.fbqContent = fbqContent;
		this.fbqCount = fbqCount;
		this.chapterNo = chapterNo;
		this.teacherNo = teacherNo;
		this.percent = percent;
		this.courseNo = courseNo;
		this.subjectTitle = subjectTitle;
		this.chapterContent = chapterContent;
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

	public int getChapterNo() {
		return chapterNo;
	}

	public void setChapterNo(int chapterNo) {
		this.chapterNo = chapterNo;
	}

	public int getTeacherNo() {
		return teacherNo;
	}

	public void setTeacherNo(int teacherNo) {
		this.teacherNo = teacherNo;
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

	public double getPercent() {
		return percent;
	}

	public void setPercent(double percent) {
		this.percent = percent;
	}

	public int getCourseNo() {
		return courseNo;
	}

	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}

	@Override
	public String toString() {
		return "FeedbackQuestionVo [fbqNo=" + fbqNo + ", fbqContent=" + fbqContent + ", fbqCount=" + fbqCount
				+ ", chapterNo=" + chapterNo + ", teacherNo=" + teacherNo + ", percent=" + percent + ", courseNo="
				+ courseNo + ", subjectTitle=" + subjectTitle + ", chapterContent=" + chapterContent + "]";
	}

}
