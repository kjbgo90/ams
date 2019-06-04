package net.ourams.vo;

public class fileUpLoadVo {
	private int fileNo;
	private String fileName;
	private String saveName;
	private long fileSize;
	private String regDate;
	private String filepath;
	
	public fileUpLoadVo() { }

	public fileUpLoadVo(int fileNo, String fileName, String saveName, long fileSize, String regDate, String filepath) {
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.saveName = saveName;
		this.fileSize = fileSize;
		this.regDate = regDate;
		this.filepath = filepath;
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

	@Override
	public String toString() {
		return "fileUpLoadVo [fileNo=" + fileNo + ", fileName=" + fileName + ", saveName=" + saveName + ", fileSize="
				+ fileSize + ", regDate=" + regDate + ", filepath=" + filepath + "]";
	}
	
	
}
