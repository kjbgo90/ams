package net.ourams.vo;

public class SubjectVo {

	private int subjectNo;
	private String subjectTitle;
	private int courseNo;
	private int scheduleNo;

	public SubjectVo() {
	}

	public SubjectVo(int subjectNo, String subjectTitle, int courseNo, int scheduleNo) {
		this.subjectNo = subjectNo;
		this.subjectTitle = subjectTitle;
		this.courseNo = courseNo;
		this.scheduleNo = scheduleNo;
	}

	public int getSubjectNo() {
		return subjectNo;
	}

	public void setSubjectNo(int subjectNo) {
		this.subjectNo = subjectNo;
	}

	public String getSubjectTitle() {
		return subjectTitle;
	}

	public void setSubjectTitle(String subjectTitle) {
		this.subjectTitle = subjectTitle;
	}

	public int getCourseNo() {
		return courseNo;
	}

	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}

	public int getScheduleNo() {
		return scheduleNo;
	}

	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}

	@Override
	public String toString() {
		return "SubjectVo [subjectNo=" + subjectNo + ", subjectTitle=" + subjectTitle + ", courseNo=" + courseNo
				+ ", scheduleNo=" + scheduleNo + "]";
	}

}
