package net.ourams.vo;


public class ReplyVo {
	private int reply;
	private int postNo;
	private int cpostNo;
	private int userNo;
	private String regDate;
	private String replyContent;
	private String creplyContent;
	private String userName;
	private String logoPath;
	private int creplyno;
	
	
	public ReplyVo() {
	}



	


	public ReplyVo(int reply, int postNo, int cpostNo, int userNo, String regDate, String replyContent,
			String creplyContent, String userName, String logoPath, int creplyno) {
		super();
		this.reply = reply;
		this.postNo = postNo;
		this.cpostNo = cpostNo;
		this.userNo = userNo;
		this.regDate = regDate;
		this.replyContent = replyContent;
		this.creplyContent = creplyContent;
		this.userName = userName;
		this.logoPath = logoPath;
		this.creplyno = creplyno;
	}






	public int getReply() {
		return reply;
	}



	public void setReply(int reply) {
		this.reply = reply;
	}



	public int getPostNo() {
		return postNo;
	}



	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}



	public int getUserNo() {
		return userNo;
	}



	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}



	public String getRegDate() {
		return regDate;
	}



	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	
	


	public String getUserName() {
		return userName;
	}




	public void setUserName(String userName) {
		this.userName = userName;
	}




	public String getLogoPath() {
		return logoPath;
	}




	public void setLogoPath(String logoPath) {
		this.logoPath = logoPath;
	}




	public String getReplyContent() {
		return replyContent;
	}



	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}




	public int getCpostNo() {
		return cpostNo;
	}



	public void setCpostNo(int cpostNo) {
		this.cpostNo = cpostNo;
	}



	public String getCreplyContent() {
		return creplyContent;
	}



	public void setCreplyContent(String creplyContent) {
		this.creplyContent = creplyContent;
	}
	
	



	public int getCreplyno() {
		return creplyno;
	}






	public void setCreplyno(int creplyno) {
		this.creplyno = creplyno;
	}






	@Override
	public String toString() {
		return "ReplyVo [reply=" + reply + ", postNo=" + postNo + ", cpostNo=" + cpostNo + ", userNo=" + userNo
				+ ", regDate=" + regDate + ", replyContent=" + replyContent + ", creplyContent=" + creplyContent
				+ ", userName=" + userName + ", logoPath=" + logoPath + ", creplyno=" + creplyno + "]";
	}





	
}


