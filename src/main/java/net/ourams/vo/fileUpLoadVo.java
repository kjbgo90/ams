package net.ourams.vo;

public class fileUpLoadVo {
	private int fileNo;
	private String fileName;
	private String saveName;
	private long fileSize;
	private String regDate;
	private String filepath;
	private int assignmentFileNo;
	private int assignmentNo;
	private int cfileNo;
	private int cpostNo;
	private int submitFileNo;
	private int submitNo;
	private int postFileNo;
	private int postNo;

	public fileUpLoadVo() {
	}

	public fileUpLoadVo(int fileNo, String fileName, String saveName, long fileSize, String regDate, String filepath,
			int assignmentFileNo, int assignmentNo, int cfileNo, int cpostNo, int submitFileNo, int submitNo,
			int postFileNo, int postNo) {
		super();
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.saveName = saveName;
		this.fileSize = fileSize;
		this.regDate = regDate;
		this.filepath = filepath;
		this.assignmentFileNo = assignmentFileNo;
		this.assignmentNo = assignmentNo;
		this.cfileNo = cfileNo;
		this.cpostNo = cpostNo;
		this.submitFileNo = submitFileNo;
		this.submitNo = submitNo;
		this.postFileNo = postFileNo;
		this.postNo = postNo;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public int getAssignmentFileNo() {
		return assignmentFileNo;
	}

	public void setAssignmentFileNo(int assignmentFileNo) {
		this.assignmentFileNo = assignmentFileNo;
	}

	public int getAssignmentNo() {
		return assignmentNo;
	}

	public void setAssignmentNo(int assignmentNo) {
		this.assignmentNo = assignmentNo;
	}

	public int getCfileNo() {
		return cfileNo;
	}

	public void setCfileNo(int cfileNo) {
		this.cfileNo = cfileNo;
	}

	public int getCpostNo() {
		return cpostNo;
	}

	public void setCpostNo(int cpostNo) {
		this.cpostNo = cpostNo;
	}

	public int getSubmitFileNo() {
		return submitFileNo;
	}

	public void setSubmitFileNo(int submitFileNo) {
		this.submitFileNo = submitFileNo;
	}

	public int getSubmitNo() {
		return submitNo;
	}

	public void setSubmitNo(int submitNo) {
		this.submitNo = submitNo;
	}

	public int getPostFileNo() {
		return postFileNo;
	}

	public void setPostFileNo(int postFileNo) {
		this.postFileNo = postFileNo;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	@Override
	public String toString() {
		return "fileUpLoadVo [fileNo=" + fileNo + ", fileName=" + fileName + ", saveName=" + saveName + ", fileSize="
				+ fileSize + ", regDate=" + regDate + ", filepath=" + filepath + ", assignmentFileNo="
				+ assignmentFileNo + ", assignmentNo=" + assignmentNo + ", submitFileNo=" + submitFileNo + ", submitNo="
				+ submitNo + ", postFileNo=" + postFileNo + ", postNo=" + postNo + "]";
	}

}
