package net.ourams.vo;

public class SubmitVo {

	private int submitNo;
	private String submitContent;
	private String submitDate;
	private int assignmentNo;
	private int userNo;
	private int fileNo;

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

	@Override
	public String toString() {
		return "SubmitVo [submitNo=" + submitNo + ", submitContent=" + submitContent + ", submitDate=" + submitDate
				+ ", assignmentNo=" + assignmentNo + ", userNo=" + userNo + ", fileNo=" + fileNo + "]";
	}

}
