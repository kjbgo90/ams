package net.ourams.vo;

public class ScheduleTagVo {
	private int scheduleTagNo;
	private int userNo;
	private int scheduleNo;
	
	public ScheduleTagVo() {
		
	}
	
	public ScheduleTagVo(int scheduleTagNo, int userNo, int scheduleNo) {
		super();
		this.scheduleTagNo = scheduleTagNo;
		this.userNo = userNo;
		this.scheduleNo = scheduleNo;
	}

	public int getScheduleTagNo() {
		return scheduleTagNo;
	}

	public void setScheduleTagNo(int scheduleTagNo) {
		this.scheduleTagNo = scheduleTagNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getScheduleNo() {
		return scheduleNo;
	}

	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}
	
	@Override
	public String toString() {
		return "ScheduleTagVo [scheduleTagNo=" + scheduleTagNo + ", userNo=" + userNo + ", scheduleNo=" + scheduleNo + "]";
	}
	
	
	
}
