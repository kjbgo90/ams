package net.ourams.vo;

import java.util.List;

public class AssignmentVo {

	private int assignmentNo;
	private String assignmentTitle;
	private String assignmentContent;
	private int courseNo;
	private String courseName;
	private int subjectNo;
	private String subjectTitle;
	private int chapterNo;
	private String chapterContent;
	private int teacherNo;
	private String userName;
	private String email;
	private String logoPath;
	private String startDate;
	private String endDate;
	private int scheduleNo;
	private int fileNo;
	private List<fileUpLoadVo> fileList;

	public AssignmentVo() {
	}

	public AssignmentVo(int assignmentNo, String assignmentTitle, String assignmentContent, int courseNo, int subjectNo,
			int chapterNo, int teacherNo, int scheduleNo, int fileNo) {
		this.assignmentNo = assignmentNo;
		this.assignmentTitle = assignmentTitle;
		this.assignmentContent = assignmentContent;
		this.courseNo = courseNo;
		this.subjectNo = subjectNo;
		this.chapterNo = chapterNo;
		this.teacherNo = teacherNo;
		this.scheduleNo = scheduleNo;
		this.fileNo = fileNo;
	}

	public AssignmentVo(int assignmentNo, String assignmentTitle, String assignmentContent, int courseNo,
			String courseName, int subjectNo, String subjectTitle, int chapterNo, String chapterContent, int teacherNo,
			String userName, String email, String logoPath, String startDate, String endDate, int scheduleNo,
			int fileNo) {
		this.assignmentNo = assignmentNo;
		this.assignmentTitle = assignmentTitle;
		this.assignmentContent = assignmentContent;
		this.courseNo = courseNo;
		this.courseName = courseName;
		this.subjectNo = subjectNo;
		this.subjectTitle = subjectTitle;
		this.chapterNo = chapterNo;
		this.chapterContent = chapterContent;
		this.teacherNo = teacherNo;
		this.userName = userName;
		this.email = email;
		this.logoPath = logoPath;
		this.startDate = startDate;
		this.endDate = endDate;
		this.scheduleNo = scheduleNo;
		this.fileNo = fileNo;
	}

	public AssignmentVo(int assignmentNo, String assignmentTitle, String assignmentContent, int courseNo,
			String courseName, int subjectNo, String subjectTitle, int chapterNo, String chapterContent, int teacherNo,
			String userName, String email, String logoPath, String startDate, String endDate, int scheduleNo,
			int fileNo, List<fileUpLoadVo> fileList) {
		this.assignmentNo = assignmentNo;
		this.assignmentTitle = assignmentTitle;
		this.assignmentContent = assignmentContent;
		this.courseNo = courseNo;
		this.courseName = courseName;
		this.subjectNo = subjectNo;
		this.subjectTitle = subjectTitle;
		this.chapterNo = chapterNo;
		this.chapterContent = chapterContent;
		this.teacherNo = teacherNo;
		this.userName = userName;
		this.email = email;
		this.logoPath = logoPath;
		this.startDate = startDate;
		this.endDate = endDate;
		this.scheduleNo = scheduleNo;
		this.fileNo = fileNo;
		this.fileList = fileList;
	}

	public int getAssignmentNo() {
		return assignmentNo;
	}

	public void setAssignmentNo(int assignmentNo) {
		this.assignmentNo = assignmentNo;
	}

	public String getAssignmentTitle() {
		return assignmentTitle;
	}

	public void setAssignmentTitle(String assignmentTitle) {
		this.assignmentTitle = assignmentTitle;
	}

	public String getAssignmentContent() {
		return assignmentContent;
	}

	public void setAssignmentContent(String assignmentContent) {
		this.assignmentContent = assignmentContent;
	}

	public int getCourseNo() {
		return courseNo;
	}

	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}

	public int getSubjectNo() {
		return subjectNo;
	}

	public void setSubjectNo(int subjectNo) {
		this.subjectNo = subjectNo;
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

	public int getScheduleNo() {
		return scheduleNo;
	}

	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLogoPath() {
		return logoPath;
	}

	public void setLogoPath(String logoPath) {
		this.logoPath = logoPath;
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

	public List<fileUpLoadVo> getFileList() {
		return fileList;
	}

	public void setFileList(List<fileUpLoadVo> fileList) {
		this.fileList = fileList;
	}

	@Override
	public String toString() {
		return "AssignmentVo [assignmentNo=" + assignmentNo + ", assignmentTitle=" + assignmentTitle
				+ ", assignmentContent=" + assignmentContent + ", courseNo=" + courseNo + ", courseName=" + courseName
				+ ", subjectNo=" + subjectNo + ", subjectTitle=" + subjectTitle + ", chapterNo=" + chapterNo
				+ ", chapterContent=" + chapterContent + ", teacherNo=" + teacherNo + ", userName=" + userName
				+ ", email=" + email + ", logoPath=" + logoPath + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", scheduleNo=" + scheduleNo + ", fileNo=" + fileNo + ", fileList=" + fileList + "]";
	}

}
