package net.ourams.vo;

public class MyPageVo {
	
	
	//courseRegist
	private int registNo;
	private int userNo;
	private int seatNo;
	private int AccessStat;
	//course
	private int courseNo;
	private String courseName;
	private String startDate;
	private String endDate;
	private int teacherNo;
	private int managerNo;
	private String coursePath;
	
	
	//기본 생성자 
	public MyPageVo() {}
	
	//생성자
	public MyPageVo(int registNo, int userNo, int seatNo, int accessStat, int courseNo, String courseName,
			String startDate, String endDate, int teacherNo, int managerNo, String coursePath) {
		this.registNo = registNo;
		this.userNo = userNo;
		this.seatNo = seatNo;
		AccessStat = accessStat;
		this.courseNo = courseNo;
		this.courseName = courseName;
		this.startDate = startDate;
		this.endDate = endDate;
		this.teacherNo = teacherNo;
		this.managerNo = managerNo;
		this.coursePath = coursePath;
	}
	public int getRegistNo() {
		return registNo;
	}
	public void setRegistNo(int registNo) {
		this.registNo = registNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getSeatNo() {
		return seatNo;
	}
	public void setSeatNo(int seatNo) {
		this.seatNo = seatNo;
	}
	public int getAccessStat() {
		return AccessStat;
	}
	public void setAccessStat(int accessStat) {
		AccessStat = accessStat;
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
		return "MyPageVo [registNo=" + registNo + ", userNo=" + userNo + ", seatNo=" + seatNo + ", AccessStat="
				+ AccessStat + ", courseNo=" + courseNo + ", courseName=" + courseName + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", teacherNo=" + teacherNo + ", managerNo=" + managerNo + ", coursePath="
				+ coursePath + "]";
	}
	
	
	
	
}
