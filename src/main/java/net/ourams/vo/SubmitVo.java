package net.ourams.vo;

import java.util.List;

public class SubmitVo {

	private int submitNo;
	private String submitContent;
	private String submitDate;
	private int assignmentNo;
	private String assignmentTitle;
	private int userNo;
	private String userName;
	private String logoPath;
	private String email;
	private int fileNo;
	private String fileName;
	private List<fileUpLoadVo> fileList;
	private int score;
	private String scoreCheck;
	private int courseNo;

	public SubmitVo() {
	}

	public SubmitVo(int submitNo, String submitContent, String submitDate, int assignmentNo, String assignmentTitle,
			int userNo, String userName, String logoPath, String email, int fileNo, String fileName,
			List<fileUpLoadVo> fileList, int score, String scoreCheck, int courseNo) {
		this.submitNo = submitNo;
		this.submitContent = submitContent;
		this.submitDate = submitDate;
		this.assignmentNo = assignmentNo;
		this.assignmentTitle = assignmentTitle;
		this.userNo = userNo;
		this.userName = userName;
		this.logoPath = logoPath;
		this.email = email;
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.fileList = fileList;
		this.score = score;
		this.scoreCheck = scoreCheck;
		this.courseNo = courseNo;
	}

	public int getCourseNo() {
		return courseNo;
	}

	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}

	public int getSubmitNo() {
		return submitNo;
	}

	public void setSubmitNo(int submitNo) {
		this.submitNo = submitNo;
	}

	public String getSubmitContent() {
		return submitContent;
	}

	public void setSubmitContent(String submitContent) {
		this.submitContent = submitContent;
	}

	public String getSubmitDate() {
		return submitDate;
	}

	public void setSubmitDate(String submitDate) {
		this.submitDate = submitDate;
	}

	public int getAssignmentNo() {
		return assignmentNo;
	}

	public void setAssignmentNo(int assignmentNo) {
		this.assignmentNo = assignmentNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getLogoPath() {
		return logoPath;
	}

	public void setLogoPath(String logoPath) {
		this.logoPath = logoPath;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<fileUpLoadVo> getFileList() {
		return fileList;
	}

	public void setFileList(List<fileUpLoadVo> fileList) {
		this.fileList = fileList;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getScoreCheck() {
		return scoreCheck;
	}

	public void setScoreCheck(String scoreCheck) {
		this.scoreCheck = scoreCheck;
	}

	public String getAssignmentTitle() {
		return assignmentTitle;
	}

	public void setAssignmentTitle(String assignmentTitle) {
		this.assignmentTitle = assignmentTitle;
	}

	@Override
	public String toString() {
		return "SubmitVo [submitNo=" + submitNo + ", submitContent=" + submitContent + ", submitDate=" + submitDate
				+ ", assignmentNo=" + assignmentNo + ", assignmentTitle=" + assignmentTitle + ", userNo=" + userNo
				+ ", userName=" + userName + ", logoPath=" + logoPath + ", email=" + email + ", fileNo=" + fileNo
				+ ", fileName=" + fileName + ", fileList=" + fileList + ", score=" + score + ", scoreCheck="
				+ scoreCheck + ", courseNo=" + courseNo + "]";
	}

}
