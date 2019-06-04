package net.ourams.vo;

public class CourseVo {
	private int courseNo;
	private String courseName;
	private int lecRoonNo;
	private String startDate;
	private String endDate;
	private int teacherNo;
	private int managerNo;
	private String coursePath;

	public CourseVo() {
	}

	public CourseVo(int courseNo, String courseName, int lecRoonNo, String startDate, String endDate, int teacherNo,
			int managerNo, String coursePath) {
		this.courseNo = courseNo;
		this.courseName = courseName;
		this.lecRoonNo = lecRoonNo;
		this.startDate = startDate;
		this.endDate = endDate;
		this.teacherNo = teacherNo;
		this.managerNo = managerNo;
		this.coursePath = coursePath;
	}

	public int getCourseNo() {
		return courseNo;
	}

	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public int getLecRoonNo() {
		return lecRoonNo;
	}

	public void setLecRoonNo(int lecRoonNo) {
		this.lecRoonNo = lecRoonNo;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getTeacherNo() {
		return teacherNo;
	}

	public void setTeacherNo(int teacherNo) {
		this.teacherNo = teacherNo;
	}

	public int getManagerNo() {
		return managerNo;
	}

	public void setManagerNo(int managerNo) {
		this.managerNo = managerNo;
	}

	public String getCoursePath() {
		return coursePath;
	}

	public void setCoursePath(String coursePath) {
		this.coursePath = coursePath;
	}

	@Override
	public String toString() {
		return "CourseVo [courseNo=" + courseNo + ", courseName=" + courseName + ", lecRoonNo=" + lecRoonNo
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", teacherNo=" + teacherNo + ", managerNo="
				+ managerNo + ", coursePath=" + coursePath + "]";
	}

}
