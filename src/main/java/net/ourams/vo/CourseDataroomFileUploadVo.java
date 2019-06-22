package net.ourams.vo;

import java.util.List;

public class CourseDataroomFileUploadVo {

	private String fileName;
	private String filePath;
	private long fileSize;
	private String saveName;
	private List<Integer> tagNoList;
	private int dataRoomNo;

	private String coursePath;

	public CourseDataroomFileUploadVo() {
	}

	public CourseDataroomFileUploadVo(String fileName, String filePath, long fileSize, String saveName,
			List<Integer> tagNoList, int dataRoomNo, String coursePath) {
		super();
		this.fileName = fileName;
		this.filePath = filePath;
		this.fileSize = fileSize;
		this.saveName = saveName;
		this.tagNoList = tagNoList;
		this.dataRoomNo = dataRoomNo;
		this.coursePath = coursePath;
	}
	
	

	public String getCoursePath() {
		return coursePath;
	}

	public void setCoursePath(String coursePath) {
		this.coursePath = coursePath;
	}

	public int getDataRoomNo() {
		return dataRoomNo;
	}

	public void setDataRoomNo(int dataRoomNo) {
		this.dataRoomNo = dataRoomNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	public List<Integer> getTagNoList() {
		return tagNoList;
	}

	public void setTagNoList(List<Integer> tagNoList) {
		this.tagNoList = tagNoList;
	}

	@Override
	public String toString() {
		return "CourseDataroomFileUploadVo [fileName=" + fileName + ", filePath=" + filePath + ", fileSize=" + fileSize
				+ ", saveName=" + saveName + ", tagNoList=" + tagNoList + ", dataRoomNo=" + dataRoomNo + ", coursePath="
				+ coursePath + "]";
	}

}