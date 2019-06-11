package net.ourams.vo;

public class PostVo {
	private int postNo;
	private int postType;
	private int userNo;
	private int fileNo;
	private int courseNo;
	private String regDate;
	private int communityNo;
	private int scheduleNo;
	private String postTitle;
	private String postContent;
	private int hit;
	private String category;
	private String userName;
	private int rownum;
	private int subjectNo; 
	private String subjectTitle;

	public PostVo() {
	}

	public PostVo(int postNo, int postType, int userNo, int fileNo, int courseNo, String regDate, int communityNo,
			int scheduleNo, String postTitle, String postContent, int hit, String category, String userName, int rownum,
			int subjectNo, String subjectTitle) {
		super();
		this.postNo = postNo;
		this.postType = postType;
		this.userNo = userNo;
		this.fileNo = fileNo;
		this.courseNo = courseNo;
		this.regDate = regDate;
		this.communityNo = communityNo;
		this.scheduleNo = scheduleNo;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.hit = hit;
		this.category = category;
		this.userName = userName;
		this.rownum = rownum;
		this.subjectNo = subjectNo;
		this.subjectTitle = subjectTitle;
	}


	public int getRownum() {
		return rownum;
	}


	public void setRownum(int rownum) {
		this.rownum = rownum;
	}


	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getPostType() {
		return postType;
	}

	public void setPostType(int postType) {
		this.postType = postType;
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

	public int getCourseNo() {
		return courseNo;
	}

	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getCommunityNo() {
		return communityNo;
	}

	public void setCommunityNo(int communityNo) {
		this.communityNo = communityNo;
	}

	public int getScheduleNo() {
		return scheduleNo;
	}

	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	

	public int getSubjectNo() {
		return subjectNo;
	}





	public void setSubjectNo(int subjectNo) {
		this.subjectNo = subjectNo;
	}




	public String getSubjectTitle() {
		return subjectTitle;
	}

	public void setSubjectTitle(String subjectTitle) {
		this.subjectTitle = subjectTitle;
	}

	@Override
	public String toString() {
		return "PostVo [postNo=" + postNo + ", postType=" + postType + ", userNo=" + userNo + ", fileNo=" + fileNo
				+ ", courseNo=" + courseNo + ", regDate=" + regDate + ", communityNo=" + communityNo + ", scheduleNo="
				+ scheduleNo + ", postTitle=" + postTitle + ", postContent=" + postContent + ", hit=" + hit
				+ ", category=" + category + ", userName=" + userName + ", rownum=" + rownum + ", subjectNo="
				+ subjectNo + ", subjectTitle=" + subjectTitle + "]";
	}


}
