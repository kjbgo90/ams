package net.ourams.vo;

public class TimelineVo {
	private int timeLineNo;
	private String timeLineContent;
	private String regDate;
	private int timeLineUserNo;
	private int userNo;
	private int rnum;
	
	public TimelineVo() {}

	public TimelineVo(int timeLineNo, String timeLineContent, String regDate, int timeLineUserNo, int userNo) {
		this.timeLineNo = timeLineNo;
		this.timeLineContent = timeLineContent;
		this.regDate = regDate;
		this.timeLineUserNo = timeLineUserNo;
		this.userNo = userNo;
	}
	
	

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getTimeLineNo() {
		return timeLineNo;
	}

	public void setTimeLineNo(int timeLineNo) {
		this.timeLineNo = timeLineNo;
	}

	public String getTimeLineContent() {
		return timeLineContent;
	}

	public void setTimeLineContent(String timeLineContent) {
		this.timeLineContent = timeLineContent;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getTimeLineUserNo() {
		return timeLineUserNo;
	}

	public void setTimeLineUserNo(int timeLineUserNo) {
		this.timeLineUserNo = timeLineUserNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "TimelineVo [timeLineNo=" + timeLineNo + ", timeLineContent=" + timeLineContent + ", regDate=" + regDate
				+ ", timeLineUserNo=" + timeLineUserNo + ", userNo=" + userNo + "]";
	}
	
	
	
}
