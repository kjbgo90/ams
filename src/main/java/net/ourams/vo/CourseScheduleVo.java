package net.ourams.vo;

import java.util.List;

public class CourseScheduleVo {
	private int scheduleNo;
	private String scheduleName;
	private String scheduleMemo;
	private String startDate;
	private String endDate;
	private String eventColor;
	private int courseNo;
	private int userNo;
	private List<ScheduleTagVo> tagList;
	
	//private String startTime;
	//private String endTime;
	
	public CourseScheduleVo() {
		
	}
	
	public CourseScheduleVo(String scheduleName, String scheduleMemo, String startDate, String endDate, 
			String eventColor, int courseNo, int userNo) {
		this.scheduleName = scheduleName; 
		this.scheduleMemo = scheduleMemo; 
		this.startDate = startDate;
		this.endDate = endDate; 
		this.eventColor = eventColor; 
		this.courseNo = courseNo; 
		this.userNo = userNo; 
	}
	
	public CourseScheduleVo(int scheduleNo, String scheduleName, String scheduleMemo, String startDate, 
			String endDate, String eventColor, int courseNo, int userNo) {
		this.scheduleNo = scheduleNo; 
		this.scheduleName = scheduleName; 
		this.scheduleMemo = scheduleMemo; 
		this.startDate = startDate;
		this.endDate = endDate; 
		this.eventColor = eventColor; 
		this.courseNo = courseNo; 
		this.userNo = userNo; 
	}
	
	public int getScheduleNo() {
		return scheduleNo;
	}

	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}

	public String getScheduleName() {
		return scheduleName;
	}

	public void setScheduleName(String scheduleName) {
		this.scheduleName = scheduleName;
	}

	public String getScheduleMemo() {
		return scheduleMemo;
	}

	public void setScheduleMemo(String scheduleMemo) {
		this.scheduleMemo = scheduleMemo;
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

	public String getEventColor() {
		return eventColor;
	}

	public void setEventColor(String eventColor) {
		this.eventColor = eventColor;
	}

	public int getCourseNo() {
		return courseNo;
	}

	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public List<ScheduleTagVo> getTagList() {
		return tagList;
	}

	public void setTagList(List<ScheduleTagVo> tagList) {
		this.tagList = tagList;
	}

	@Override
	public String toString() {
		return "CourseScheduleVo [scheduleNo=" + scheduleNo + ", scheduleName=" + scheduleName + ", scheduleMemo="
				+ scheduleMemo + ", startDate=" + startDate + ", endDate=" + endDate + ", eventColor=" + eventColor
				+ ", courseNo=" + courseNo + ", userNo=" + userNo + "]";
	}
	
	public void tagToString() {
		for (int i=0; i < tagList.size(); i++) {
			System.out.println( "tagList[" +i+ "] [tagNo=" + tagList.get(i).getScheduleTagNo() + ", scheduleNo=" + tagList.get(i).getScheduleNo() + ", userNo=" + tagList.get(i).getUserNo() + "]" );
		}
	}
	
}
