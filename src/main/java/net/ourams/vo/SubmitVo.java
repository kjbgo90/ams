package net.ourams.vo;

public class SubmitVo {

	private int submitNo;
	private String submitContent;
	private String submitDate;
	private int assignmentNo;
	private int userNo;
	private String userName;
	private String logoPath;
	private String email;
	private int fileNo;
	private String fileName;

	public SubmitVo() {
	}

	public SubmitVo(int submitNo, String submitContent, String submitDate, int assignmentNo, int userNo, int fileNo) {
		this.submitNo = submitNo;
		this.submitContent = submitContent;
		this.submitDate = submitDate;
		this.assignmentNo = assignmentNo;
		this.userNo = userNo;
		this.fileNo = fileNo;
	}

	public SubmitVo(int submitNo, String submitContent, String submitDate, int assignmentNo, int userNo,
			String userName, int fileNo, String fileName) {
		this.submitNo = submitNo;
		this.submitContent = submitContent;
		this.submitDate = submitDate;
		this.assignmentNo = assignmentNo;
		this.userNo = userNo;
		this.userName = userName;
		this.fileNo = fileNo;
		this.fileName = fileName;
	}

	public SubmitVo(int submitNo, String submitContent, String submitDate, int assignmentNo, int userNo,
			String userName, String logoPath, String email, int fileNo, String fileName) {
		this.submitNo = submitNo;
		this.submitContent = submitContent;
		this.submitDate = submitDate;
		this.assignmentNo = assignmentNo;
		this.userNo = userNo;
		this.userName = userName;
		this.logoPath = logoPath;
		this.email = email;
		this.fileNo = fileNo;
		this.fileName = fileName;
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

	@Override
	public String toString() {
		return "SubmitVo [submitNo=" + submitNo + ", submitContent=" + submitContent + ", submitDate=" + submitDate
				+ ", assignmentNo=" + assignmentNo + ", userNo=" + userNo + ", userName=" + userName + ", logoPath="
				+ logoPath + ", email=" + email + ", fileNo=" + fileNo + ", fileName=" + fileName + "]";
	}

}
