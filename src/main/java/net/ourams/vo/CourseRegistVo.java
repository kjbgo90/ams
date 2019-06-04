package net.ourams.vo;

public class CourseRegistVo {
	private int registNo;
	private int userNo;
	private int courseNo;
	private int seatNo;

	public CourseRegistVo() {
	}

	public CourseRegistVo(int registNo, int userNo, int courseNo, int seatNo) {
		this.registNo = registNo;
		this.userNo = userNo;
		this.courseNo = courseNo;
		this.seatNo = seatNo;
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

	public int getCourseNo() {
		return courseNo;
	}

	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}

	public int getSeatNo() {
		return seatNo;
	}

	public void setSeatNo(int seatNo) {
		this.seatNo = seatNo;
	}

	@Override
	public String toString() {
		return "CourseRegistVo [registNo=" + registNo + ", userNo=" + userNo + ", courseNo=" + courseNo + ", seatNo="
				+ seatNo + "]";
	}

}
